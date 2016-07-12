<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require_once '../src/DbHandler.php';
require_once '../src/PassHash.php';
require '../vendor/autoload.php';

//header("Content-type: text/html; charset=utf-8");
// \Slim\Slim::registerAutoloader();


use Slim\App;

class AppContainer
{
    private static $app = null;

    public static function getInstance()
    {
        if (null === self::$app) {
            self::$app = self::makeInstance();
        }

        return self::$app;
    }

    private static function makeInstance()
    {
        $app = new App();
        // do all logic for adding routes etc

        return $app;
    }
}
$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false; 

$config['db']['host']   = "localhost";
$config['db']['user']   = "user";
$config['db']['pass']   = "password";
$config['db']['dbname'] = "exampleapp";

$app = new \Slim\App(["settings" => $config]);
//$app =  AppContainer::getInstance(); //new \Slim\App;
$container = $app->getContainer();
$container['logger'] = function($c) {
    $logger = new \Monolog\Logger('my_logger');
    $file_handler = new \Monolog\Handler\StreamHandler("../logs/app.log");
    $logger->pushHandler($file_handler);
    return $logger;
};


// User id from db - Global Variable
$user_id = NULL;

/**
 * Adding Middle Layer to authenticate every request
 * Checking if the request has valid api key in the 'Authorization' header

$mw = function authenticate($req, $res, $next) {
    // Getting request headers
    $headers = $request->getHeaders();
    $response = array();
    //$app = \Slim\App::getInstance();

    // Verifying Authorization Header
    if (isset($headers['Authorization'])) {
        $db = new DbHandler();

        // get the api key
        $api_key = $headers['Authorization'];
        // validating api key
        if (!$db->isValidApiKey($api_key)) {
            // api key is not present in users table
            $response["error"] = true;
            $response["message"] = "Access Denied. Invalid Api key";
            $response->withStatus(401)->write(json_encode($response));
        } else {
            global $user_id;
            // get user primary key id
            $user_id = $db->getUserId($api_key);
        }
    } else {
        // api key is missing in header
        $response["error"] = true;
        $response["message"] = "Api key is misssing";
        echoRespnse(400, $response);
        $app->stop();
    }
}*/

/**
 * ----------- METHODS WITHOUT AUTHENTICATION ---------------------------------
 */
/**
 * User Registration
 * url - /register
 * method - POST
 * params - name, email, password
 */

 
$app->post('/register', function(Request $req,  Response $res) {
            // check for required params

            $result = verifyRequiredParams(array('name', 'email', 'password'), $req);
            if ($result["error"] == true) {
                $errorResponse = $res->withJson($result, 400);
                return $errorResponse;
            }

            $response = array();
            // reading post params
            $name= $req->getParsedBody()['name'];
            $email = $req->getParsedBody()['email'];
            $password = $req->getParsedBody()['password'];

            // validating email address
            $emailval = validateEmail($email);
            if ($emailval["error"] == true) {
                $errorResponse = $res->withJson($emailval, 400);
                return $errorResponse;
            }

            $db = new DbHandler();
            $db_res = $db->createUser($name, $email, $password);

            if ($db_res == USER_CREATED_SUCCESSFULLY) {
                $response["error"] = false;
                $response["message"] = "You are successfully registered.";
            } else if ($db_res == USER_CREATE_FAILED) {
                $response["error"] = true;
                $response["message"] = "An error occurred while registering.";
            } else if ($db_res == USER_ALREADY_EXISTED) {
                $response["error"] = true;
                $response["message"] = "Sorry, this email already in use.";
            }
            // echo json response
            return $res->withJson($response, 201);
        });

/**
 * User Login
 * url - /login
 * method - POST
 * params - email, password
 */
$app->post('/login', function(Request $req,  Response $res) {
            // check for required params
            $result = verifyRequiredParams(array('email', 'password'), $req);
            if ($result["error"] == true) {
                $errorResponse = $res->withJson($result, 400);
                return $errorResponse;
            }

            // reading post params
            $email = $req->getParsedBody()['email'];
            $password = $req->getParsedBody()['password'];
            $response = array();

            $db = new DbHandler();
            // check for correct email and password
            if ($db->checkLogin($email, $password)) {
                // get the user by email
                $user = $db->getUserByEmail($email);
                if ($user != NULL) {
                    $response["error"] = false;
                    $response['user_name'] = $user['user_name'];
                    $response['user_email'] = $user['user_email'];
                    $response['api_key'] = $user['api_key'];
                    $response['created_at'] = $user['created_at'];
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "An error occurred. Please try again.";
                }
            } else {
                // user credentials are wrong
                $response['error'] = true;
                $response['message'] = 'Login failed. Incorrect credentials';
            }
            $res_json = $res->withHeader('Content-type', 'application/json');
            return $res_json->withStatus(200)->write(json_encode($response));
        });


$app->get('/professors',  function(Request $request,  Response $response)  {
            $data = array();
            $db = new DbHandler($this->logger);
            $parameters = $request->getQueryParams();
            // fetching all professors
            $sort = array_key_exists("sort_by", $parameters)? $parameters["sort_by"] : NULL;
            $order =  array_key_exists("order", $parameters)? $parameters["order"] : NULL;
            $start = array_key_exists("start", $parameters)? (int)$parameters["start"] : NULL;
            $limit = array_key_exists("limit", $parameters)? (int)$parameters["limit"] : NULL;
            sleep(1);

            if ($request->hasHeader('sort_by')) {
                $sort = $request->getHeader('sort_by')[0];
            } 

            if ($request->hasHeader('order')) {
                $order = $request->getHeader('order')[0];
            }

            if ($request->hasHeader('start')) {
                $start = (int)$request->getHeader('start')[0];
            } 
            if ($request->hasHeader('limit')) {
                $limit = (int)$request->getHeader('limit')[0];
            } 

            $result = $db->getProfessors($sort, $order, $start, $limit);
            $data["error"] = false;
            $data["professors"] = array();

            // looping through result and preparing professor array
            while ($prof = $result->fetch_assoc()) {
                $tmp = array();
                $tmp["professor_id"] = $prof["professor_id"];
                $tmp["professor_name"] = $prof["professor_name"];
                $tmp["professor_picture"] = $prof["professor_picture"];
                $tmp["professor_description"] = $prof["professor_description"];
                $tmp["professor_email"] = $prof["professor_email"];
                $tmp["professor_room"] = $prof["professor_room"];
                array_push($data["professors"], $tmp);
            }
            $res_json = $response->withHeader('Content-type', 'application/json');
            return $res_json->withStatus(200)->write(json_encode($data));
        });

/**
 *  Returns professors by ID
 */
$app->get('/professors/{id}',  function(Request $req,  Response $res)  {
    $id = $req->getAttribute('id');
    $db = new DbHandler();
    $result = $db->getProfessorByID($id);
    $response = array();
    $response["error"] = false;
    $prof = $result->fetch_assoc();
    $response["professor"] = $prof;
    return $res->withJson($response, 200);
});

/*
 * ------------------------ METHODS WITH AUTHENTICATION ------------------------
 */


/**
 * Verifying required params posted or not
 */
function verifyRequiredParams($required_fields, Request $request) {
    $error = false;
    $error_fields = "";
    $request_params = array();
    $request_params = $_REQUEST;
    // Handling PUT request params
    if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
        parse_str(request()->getBody(), $request_params);
    }
    foreach ($required_fields as $field) {
        if (!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {
            $error = true;
            $error_fields .= $field . ', ';
        }
    }

    $response = array();
    $response["error"] = $error;
    if ($error) {
        // Required field(s) are missing or empty
        $response["message"] = 'Required field(s) ' . substr($error_fields, 0, -2) . ' is missing or empty';
    }
    return $response;
}

/**
 * Validating email address
 */
function validateEmail($email) {
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $response["error"] = true;
        $response["message"] = 'Email address is not valid';
    }
    else {
        $response["error"] = false;
    }
    return $response;
}

$app->run();
?>
