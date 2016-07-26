use profedex;

delimiter $$
CREATE PROCEDURE rate(uid INT, pid INT, rid INT, rval FLOAT)
begin
IF EXISTS(SELECT * FROM rating WHERE user_id = uid AND professor_id = pid AND rating_type_id = rid) THEN
	UPDATE rating SET rating_value = rval WHERE user_id = uid AND professor_id = pid AND rating_type_id = rid;
ELSE
	INSERT INTO rating (rating_value, professor_id, user_id, rating_type_id) VALUES (rval, pid, uid, rid);
END IF;
    end $$
delimiter ;

/* Inserts academic_center */
INSERT INTO `profedex`.`academic_center` (`center_id`, `center_name`) VALUES ('1', 'Engenharia Química');
INSERT INTO `profedex`.`academic_center` (`center_id`, `center_name`) VALUES ('2', 'Engenharia Elétrica');
INSERT INTO `profedex`.`academic_center` (`center_id`, `center_name`) VALUES ('3', 'Engenharia Eletrônica e Computação');
INSERT INTO `profedex`.`academic_center` (`center_id`, `center_name`) VALUES ('4', 'Engenharia da Computação e Informação');
INSERT INTO `profedex`.`academic_center` (`center_id`, `center_name`) VALUES ('5', 'Ciência da Computação');
INSERT INTO `profedex`.`academic_center` (`center_id`, `center_name`) VALUES ('6', 'Matemática Aplicada');
INSERT INTO `profedex`.`academic_center` (`center_id`, `center_name`) VALUES ('7', 'Química - Bacharelado');
INSERT INTO `profedex`.`academic_center` (`center_id`, `center_name`) VALUES ('8', 'Física Bacharelado');

INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('2', 'Dernando José', 'dernando@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '1', 'BCF326262511', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('3', 'Maria da Conceição', 'maria@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '3', 'FDC84451518', '1');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('4', 'Alexis Saludjian', 'alexis@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '4', 'BAC487487441478', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('5', 'Ana Célia', 'ana@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '7', 'CAF8481151784', '1');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `update_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('6', 'André de Melo', 'andre@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '2016-07-26 07:32:25', '1', 'BAF847844414', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('7', 'Denise Lobato', 'denise@ccmn.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '6', 'DFA84481456151', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('8', 'Edson Peterli', 'edson@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '4', 'BFC32325654', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('9', 'Eduardo Costa', 'dudu@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '8', 'FCA458484145145', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('10', 'Julia Paranhos', 'julia@ccmn.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '5', 'DCA547784785', '1');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('11', 'Kelli Angela', 'keli@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '1', 'ADA84151', '1');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `update_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('12', 'Nelson Chalfun', 'nelson@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '2016-07-26 07:32:25', '3', 'ACF26626', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('13', 'Nivalde José', 'nivalde@ccmn.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '6', 'FBD556151', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('14', 'Ricardo Figueiredo', 'ricardo@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '2', 'FAD45151', '1');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `update_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('15', 'Rudi Rocha', 'rudi@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '2016-07-26 07:32:25', '7', 'CBA5145156', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('16', 'Victor Prochnik', 'victor@ccmn.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '5', 'DAC5165165', '1');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('17', 'Wilson Vieira', 'wilson@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '7', 'CCD54515561', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('18', 'Esther Dweck', 'esther@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '1', 'FBC54568415614', '0');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('19', 'João Carlos', 'joca@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '4', 'AFC121415151', '1');
INSERT INTO `profedex`.`user` (`user_id`, `user_name`, `user_email`, `password_hash`, `create_time`, `academic_center_center_id`, `api_key`, `status`) VALUES ('20', 'Marcelo Jorge', 'marceloj@poli.ufrj.br', 'AF21C69BD', '2016-07-25 04:33:22', '3', 'BAC48748754', '1');

/* Inserts tabela professores */
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('1', 'Alexandre Carlos Tort', 'ale@if.ufrj.br', 'Professor Associado do IF', 'A-325');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('2', 'Belita Koiller', 'bel@if..ufrj.br', 'Professor Titular do IF', 'A-410');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('3', 'Bnjamin Rache Salles', 'benji@if.ufrj.br', 'Professor Adjunto do IF', 'A-312');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('4', 'Carlos Eduardo Magalhães de Aguiar', 'cadu@if.ufrj.br', 'Professor Associado do IF', 'A-407');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('5', 'Deise Miranda Vianna', 'dedeca@if.ufrj.br', 'Professor Associado do IF', 'A-306');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('6', 'Irina Nasteva', 'irina@if.ufrj.br', 'Professor Adjunto do IF', 'A-409');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('7', 'Marcus Venicius Cougo Pinto', 'marcote@if.ufrj.br', 'Professor Adjunto do IF', 'A-326');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('8', 'Erasmo Madureira Ferreira', 'erasmo@if.ufrj.br', 'Professor Emérito do IF', 'A-321');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('9', 'Flávio Assemany', 'flavio@im.ufrj.br', 'Professor Titular do IM', 'CCMN/F-405');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('10', 'Juliana Vianna Valério', 'juviva@im.ufrj.br', 'Professor Adjunto do IM', 'H-306');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('11', 'Marcello Goulart Teixeira', 'cellogo@im.ufrj.br', 'Professor Associado do IM', 'C-115');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('12', 'Gérard Émile Grimberg', 'gereg@im.ufrj.br', 'Professo Associado do IM', 'C-112/B');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('13', 'Helena Judith Nussenzveig Lopes', 'helenanus@im.ufrj.br', 'Professor Adjunto do IM', 'H-303/D');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('14', 'Jair Salvador', 'jair@im.ufrj.br', 'Professor Titular do IM', 'C-112/A');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('15', 'Alexandra Mello Schmidt', 'alexa@im.ufrj.br', 'Professor Adjunto do IM', 'C-110');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('16', 'Dani Gamerman', 'gamerman@im.ufrj.br', 'Professor Adjunto do IM', 'C-112/C');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('17', 'Glauco Vale da Silva Coelho', 'glaucovale@im.ufrj.br', 'Professor Titular do IM', 'H-303/A');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('18', 'Mariane Branco ALves', 'marialves@im.ufrj.br', 'Professor Associado do IM', 'C-121');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('19', 'Antônio Carlos Siqueira de Lima', 'toni@dee.ufrj.br', 'Professor Adjunto do DEE', 'H-303/B');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('20', 'Ivan Herszterg', 'ivan@dee.ufrj.br', 'Professor Associado do DEE', 'H-307');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('21', 'Maria Karla Vervloet Sollero', 'mariakarla@dee.ufrj.br', 'Professor Titular do DEE', 'H-203/A');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('22', 'Sandoval Carneiro Júnior', 'sandoval@dee.ufrj.br', 'Professor Adjunto do DEE', 'H-203-B');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('23', 'Heloi  José Fernandes Moreira', 'heloi@dee.ufrj.br', 'Professor Associado do DEE', 'H-201');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('24', 'Aloysio de Castro Pinto Pedroza', 'aloysiocastro@del.ufrj.br', 'Professor Emérito do DEL', 'G-110');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('25', 'Darcy do Nascimento Júnior', 'darcy@del.ufrj.br', 'Professor Adjunto do DEL', 'G-205');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('26', 'Heraldo Luis Silveira de Almeida', 'heraldo@del.ufrj.br', 'Professor Titular do DEL', 'H-206');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('27', 'Edilberto Strauss', 'strauss@del.ufrj.br', 'Professor Adjundo do DEL', 'H-213');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('28', 'Otto Carlos Muniz Bandeira Duarte', 'otto@del.ufrj.br', 'Professor Associado do DEL', 'H-309');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('29', 'Anita Dolly Panek', 'bang@iq.ufrj.br', 'Professor Emérito do IQ', 'A-427/C');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('30', 'Warner Bruce Kover', 'kover@iq.ufrj.br', 'Professor Emérito do IQ', 'A-427/B');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('31', 'Ana Lúcia de Lima', 'ana@iq.ufrj.br', 'Professor Emérito do IQ', 'A-427/A');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('32', 'Anderson de Sá Pinheiro', 'anderson@iq.ufrj.br', 'Professor Adjunto do IQ', 'A-326');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('33', 'Daniel Perrone Moreira', 'daniperrone@iq.ufrj.br', 'Professor Adjunto do IQ', 'A-421');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('34', 'Cristina Baptista Maia', 'tina@iq.ufrj.br', 'Professor Associado do IQ', 'A-408');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('35', 'Débora de Almeida', 'debs@iq.ufrj.br', 'Professor Titular do IQ', 'A-409/A');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('36', 'Giordano Poneti', 'giordando@iq.ufrj.br', 'Professor Titular do IQ', 'A-401');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('37', 'Glória Regina Cardoso Braz', 'glorinha@iq.ufrj.br', 'Professor Associado do IQ', 'A-406/B');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('38', 'Iracema Takase', 'india@iq.ufrj.br', 'Professor Titular do IQ', 'A-333/D');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('39', 'Marcelo Maciel Pereira', 'celomaciel@iq.ufrj.br', 'Professor Emérito do IQ', 'A-409/C');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('40', 'Rodrigo Octavio Mendonça Alves de Souza', 'drigs@iq.ufrj.br', 'Professor Adjunto do IQ', 'A-333/A');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('41', 'Ricardo Erthal Santelli', 'ricardinho@iq.ufrj.br', 'Professor Adjunto do IQ', 'A-333/C');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('42', 'Rosa Cristina Dias Peres', 'rosatina@iq.ufrj.br', 'Professor Associado do IQ', 'A-406/A');
INSERT INTO `profedex`.`professor` (`professor_id`, `professor_name`, `professor_email`, `professor_description`, `professor_room`) VALUES ('43', 'Tiago Messias Cardoso', 'messias@iq.ufrj.br', 'Professor Associado do IQ', 'A-409/B');

/* Inserts tabela comment */
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('1', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '6', '1');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('2', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '12', '2');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('3', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '40', '2');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('4', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '9', '1');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('5', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '1', '2');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('6', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '34', '1');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('7', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '27', '2');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('8', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '20', '1');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('9', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '16', '1');
INSERT INTO `profedex`.`comment` (`comment_id`, `comment_text`, `comment_date`, `professor_id`, `user_id`) VALUES ('10', 'Comentário sobre o profesosr aqui...', '2016-07-27 13:45:12', '33', '1');

INSERT INTO rating_type (rating_type_name) VALUES ("Didática");
INSERT INTO rating_type (rating_type_name) VALUES ("Dificuldade");
INSERT INTO rating_type (rating_type_name) VALUES ("Simpatia");
INSERT INTO rating_type (rating_type_name) VALUES ("Pontualidade");

INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('1', 'nome_voto', '1.0', '42', '1', '2');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('2', 'nome_voto', '3.3', '31', '3', '3');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('3', 'nome_voto', '2.7', '34', '5', '4');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('4', 'nome_voto', '4.6', '22', '7', '1');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('5', 'nome_voto', '5.0', '5', '6', '1');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('6', 'nome_voto', '3.2', '13', '1', '1');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('7', 'nome_voto', '1.7', '1', '4', '2');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('8', 'nome_voto', '4.2', '2', '9', '1');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('9', 'nome_voto', '2.8', '8', '10', '2');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('10', 'nome_voto', '1.4', '39', '8', '4');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('11', 'nome_voto', '2.8', '35', '13', '2');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('12', 'nome_voto', '3.2', '23', '11', '3');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('13', 'nome_voto', '4.6', '27', '20', '3');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('14', 'nome_voto', '1.0', '14', '16', '2');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('15', 'nome_voto', '5.0', '12', '14', '1');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('16', 'nome_voto', '4.6', '6', '15', '1');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('17', 'nome_voto', '2.8', '9', '17', '2');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('18', 'nome_voto', '3.3', '33', '13', '2');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('19', 'nome_voto', '4.2', '27', '12', '1');
INSERT INTO `profedex`.`rating` (`rating_id`, `rating_name`, `rating_value`, `professor_id`, `user_id`, `rating_type_id`) VALUES ('20', 'nome_voto', '1.4', '40', '19', '2');


/* Inserts tabela professor_picture */
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('1', '1', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('2', '2', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('3', '3', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('4', '4', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('5', '5', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('6', '6', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('7', '7', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('8', '8', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('9', '9', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('10', '10', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('11', '11', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('12', '12', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('13', '13', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('14', '14', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('15', '15', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('16', '16', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('17', '17', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('18', '18', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('19', '19', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('20', '20', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('21', '21', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('22', '22', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('23', '23', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('24', '24', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('25', '25', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('26', '26', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('27', '27', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('28', '28', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('29', '29', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('30', '30', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('31', '31', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('32', '32', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('33', '33', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('34', '34', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('35', '35', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('36', '36', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('37', '37', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('38', '38', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('39', '39', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('40', '40', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('41', '41', 'picture/default.png');
INSERT INTO `profedex`.`professor_picture` (`professor_id`, `picture_id`, `picture_path`) VALUES ('42', '42', 'picture/default.png');
