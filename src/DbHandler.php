<?php

class DbHandler {

    private $conn;
    private $logger;

    function __construct($logger = NULL) {
        require_once dirname(__FILE__) . '/DbConnect.php';
        // opening db connection
        $db = new DbConnect();
        $this->logger = $logger;
        $this->conn = $db->connect();
    }

    /* ------------- `users` table method ------------------ */

    /**
     * Creating new user
     * @param String $name User full name
     * @param String $email User login email id
     * @param String $password User login password
     */
    public function createUser($name, $email, $password) {
        require_once 'PassHash.php';
        $response = array();

        // First check if user already existed in db
        if (!$this->isUserExists($email)) {
            // Generating password hash
            $password_hash = PassHash::hash($password);

            // Generating API key
            $api_key = $this->generateApiKey();

            // insert query
            $stmt = $this->conn->prepare("INSERT INTO user(user_name, user_email, password_hash, api_key, status) values(?, ?, ?, ?, 1)");
            $stmt->bind_param("ssss", $name, $email, $password_hash, $api_key);

            $result = $stmt->execute();

            $stmt->close();

            // Check for successful insertion
            if ($result) {
                // User successfully inserted
                return USER_CREATED_SUCCESSFULLY;
            } else {
                // Failed to create user
                return USER_CREATE_FAILED;
            }
        } else {
            // User with same email already existed in the db
            return USER_ALREADY_EXISTED;
        }

        return $response;
    }

    /**
     * Checking user login
     * @param String $email User login email id
     * @param String $password User login password
     * @return boolean User login status success/fail
     */
    public function checkLogin($email, $password) {
        // fetching user by email
        $stmt = $this->conn->prepare("SELECT password_hash FROM user WHERE user_email = ?");

        $stmt->bind_param("s", $email);

        $stmt->execute();

        $stmt->bind_result($password_hash);

        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            // Found user with the email
            // Now verify the password

            $stmt->fetch();

            $stmt->close();

            if (PassHash::check_password($password_hash, $password)) {
                // User password is correct
                return TRUE;
            } else {
                // user password is incorrect
                return FALSE;
            }
        } else {
            $stmt->close();

            // user not existed with the email
            return FALSE;
        }
    }

    /**
     * Checking for duplicate user by email address
     * @param String $email email to check in db
     * @return boolean
     */
    private function isUserExists($email) {
        $stmt = $this->conn->prepare("SELECT user_id from user WHERE user_email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }

    /**
     * Fetching user by email
     * @param String $email User email id
     */
    public function getUserByEmail($email) {
        $stmt = $this->conn->prepare("SELECT user_name, user_email, api_key, status, create_time FROM user WHERE user_email = ?");
        $stmt->bind_param("s", $email);
        if ($stmt->execute()) {
            // $user = $stmt->get_result()->fetch_assoc();
            $stmt->bind_result($name, $email, $api_key, $status, $created_at);
            $stmt->fetch();
            $user = array();
            $user["user_name"] = $name;
            $user["user_email"] = $email;
            $user["api_key"] = $api_key;
            $user["status"] = $status;
            $user["created_at"] = $created_at;
            $stmt->close();
            return $user;
        } else {
            return NULL;
        }
    }

    /**
     * Fetching user api key
     * @param String $user_id user id primary key in user table
     */
    public function getApiKeyById($user_id) {
        $stmt = $this->conn->prepare("SELECT api_key FROM user WHERE id = ?");
        $stmt->bind_param("i", $user_id);
        if ($stmt->execute()) {
            // $api_key = $stmt->get_result()->fetch_assoc();
            // TODO
            $stmt->bind_result($api_key);
            $stmt->close();
            return $api_key;
        } else {
            return NULL;
        }
    }

    /**
     * Fetching user id by api key
     * @param String $api_key user api key
     */
    public function getUserId($api_key) {
        $stmt = $this->conn->prepare("SELECT user_id FROM user WHERE api_key = ?");
        $stmt->bind_param("s", $api_key);
        if ($stmt->execute()) {
            $stmt->bind_result($user_id);
            $stmt->fetch();
            // TODO
            // $user_id = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $user_id;
        } else {
            return NULL;
        }
    }

    /**
     * Validating user api key
     * If the api key is there in db, it is a valid key
     * @param String $api_key user api key
     * @return boolean
     */
    public function isValidApiKey($api_key) {
        $stmt = $this->conn->prepare("SELECT user_id from user WHERE api_key = ?");
        $stmt->bind_param("s", $api_key);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }

    /**
     * Generating random Unique MD5 String for user Api key
     */
    private function generateApiKey() {
        return md5(uniqid(rand(), true));
    }

    /* ------------- `professor` table method ------------------ */

    public function getProfessors($sort = NULL, $order = NULL, $start = 0, $limit = 20) {
        $query = "SELECT * FROM professor ";
        if ($sort != NULL && in_array($sort, $this->getTableFields("professor")) ) {
            if (strcasecmp($order, "desc") == 0) {$order = "DESC";} else { $order = "ASC";};
            $query .= "ORDER BY $sort $order ";
        }
        if ($limit != NULL && is_int($limit)) {
            if ($start != NULL && is_int($limit))
                $query .= "LIMIT $limit OFFSET $start";
            else
                $query .= "LIMIT $limit";
        }
        $stmt = $this->conn->prepare($query);
        //$stmt->bind_param("s", $test);
        $stmt->execute();
        $professors = $stmt->get_result();
        $stmt->close();
        return $professors;
    }

    public function createProfessor($data) {
        $stmt = $this->conn->prepare("INSERT INTO professor (professor_name, professor_email, professor_description, professor_room) VALUES (?, ? ,?, ?) ");
        if ($stmt) {
            $stmt->bind_param('ssss', $data['name'], $data['email'], $data['description'], $data['room']);
            return $stmt->execute();
        } else {
            $this->logger->addInfo($this->conn->error);
            return false;
        }
    }

    public function getProfessorByID($id) {
        $stmt = $this->conn->prepare("SELECT * FROM professor WHERE professor_id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $professor = $stmt->get_result();
        $stmt->close();
        return $professor;
    }

    public function getTableFields($table) {
        $stmt = $this->conn->prepare("SHOW COLUMNS FROM $table");
        $stmt->execute();
        $result = $stmt->get_result();
        $fields = array();
        while ($col = $result->fetch_array()) {
            array_push($fields, $col[0]);
        }
        return $fields;
    }

    public function createComment($id, $data) {
        $stmt = $this->conn->prepare("INSERT INTO comment (user_id, comment_text, professor_id) VALUES (?, ? ,?) ");
        if ($stmt) {
            $stmt->bind_param('isi', $data['user_id'], $data['comment'], $id);

            $this->logger->addInfo($this->conn->error);
            return $stmt->execute();
        } else {
            $this->logger->addInfo($this->conn->error);
            return false;
        }   
    }

    public function getComment($id, $page = 1) {
        // change to include comments
        $stmt = $this->conn->prepare("SELECT * FROM comment WHERE professor_id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $comments = $stmt->get_result();
        $stmt->close();
        return $comments;
    }

    public function getVote($comment_id) {
        // not needed
        $stmt = $this->conn->prepare("SELECT sum(vote_val) AS sum FROM vote WHERE comment_id = ?");
        $stmt->bind_param("i", $comment_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        return $result;   
    }

    public function canVote($user_id, $comment_id) {
        $stmt = $this->conn->prepare("SELECT EXISTS(SELECT 1 FROM vote WHERE voter_id = ? AND comment_id = ? LIMIT 1) ");

        $this->logger->addInfo($this->conn->error);
        $stmt->bind_param("ii", $user_id, $comment_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        if (sizeof($result) > 0) {
            return false;
        } else {
            return true;
        }
    }
}
?>
