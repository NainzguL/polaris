USE polaris;


SET @geo_ori_type_id = (SELECT id FROM OriginType WHERE name = 'geographic');

INSERT INTO Origin VALUES (NULL, 'traveller', @geo_ori_type_id);
SET @traveller_ori_id = (SELECT id FROM Origin WHERE name = 'traveller');

INSERT INTO OriginCompetence VALUES (NULL, @traveller_ori_id, 
(SELECT id FROM Competence WHERE name ='orientation'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @traveller_ori_id, 
(SELECT id FROM Competence WHERE name ='underwaterBattlesuits'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @traveller_ori_id, 
(SELECT id FROM Competence WHERE name ='vesselsPilotage'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @traveller_ori_id, 
(SELECT id FROM Competence WHERE name ='scootersDriving'), NULL, 2);
INSERT INTO OriginCompetence VALUES (NULL, @traveller_ori_id, 
(SELECT id FROM Competence WHERE name ='knowOceans'), NULL, 1);

SET @origin_choice_group_1 = '';
INSERT INTO OriginChoiceGroup VALUES (NULL);
SELECT LAST_INSERT_ID() INTO @origin_choice_group_1;

INSERT INTO OriginCompetence VALUES (NULL, @traveller_ori_id, 
(SELECT id FROM Competence WHERE name ='mechanicsVessel'), @origin_choice_group_1, 1);
INSERT INTO OriginCompetence VALUES (NULL, @traveller_ori_id, 
(SELECT id FROM Competence WHERE name ='mechanicsBattleSuits'), @origin_choice_group_1, 2);


INSERT INTO Origin VALUES (NULL, 'smallStation', @geo_ori_type_id);
SET @smallStation_ori_id = (SELECT id FROM Origin WHERE name = 'smallStation');

INSERT INTO OriginCompetence VALUES (NULL, @smallStation_ori_id, 
(SELECT id FROM Competence WHERE name ='orientation'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @smallStation_ori_id, 
(SELECT id FROM Competence WHERE name ='underwaterBattlesuits'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @smallStation_ori_id, 
(SELECT id FROM Competence WHERE name ='scootersDriving'), NULL, 2);
INSERT INTO OriginCompetence VALUES (NULL, @smallStation_ori_id, 
(SELECT id FROM Competence WHERE name ='electronic'), NULL, 1);

SET @origin_choice_group_2 = '';
INSERT INTO OriginChoiceGroup VALUES (NULL);
SELECT LAST_INSERT_ID() INTO @origin_choice_group_2;

INSERT INTO OriginCompetence VALUES (NULL, @smallStation_ori_id, 
(SELECT id FROM Competence WHERE name ='mechanicsMachinery'), @origin_choice_group_2, 2);
INSERT INTO OriginCompetence VALUES (NULL, @smallStation_ori_id, 
(SELECT id FROM Competence WHERE name ='farming'), @origin_choice_group_2, 2);


INSERT INTO Origin VALUES (NULL, 'mediumStation', @geo_ori_type_id);
SET @mediumStation_ori_id = (SELECT id FROM Origin WHERE name = 'mediumStation');

INSERT INTO OriginCompetence VALUES (NULL, @mediumStation_ori_id, 
(SELECT id FROM Competence WHERE name ='orientation'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @mediumStation_ori_id, 
(SELECT id FROM Competence WHERE name ='bureaucracy'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @mediumStation_ori_id, 
(SELECT id FROM Competence WHERE name ='underwaterBattlesuits'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @mediumStation_ori_id, 
(SELECT id FROM Competence WHERE name ='scootersDriving'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @mediumStation_ori_id, 
(SELECT id FROM Competence WHERE name ='electronic'), NULL, 1);

INSERT INTO OriginCompetence VALUES (NULL, @mediumStation_ori_id, 
(SELECT id FROM Competence WHERE name ='natHostNation'), NULL, 2);


INSERT INTO Origin VALUES (NULL, 'bigStation', @geo_ori_type_id);
SET @bigStation_ori_id = (SELECT id FROM Origin WHERE name = 'bigStation');

INSERT INTO OriginCompetence VALUES (NULL, @bigStation_ori_id, 
(SELECT id FROM Competence WHERE name ='bureaucracy'), NULL, 2);
INSERT INTO OriginCompetence VALUES (NULL, @bigStation_ori_id, 
(SELECT id FROM Competence WHERE name ='education'), NULL, 2);

INSERT INTO OriginCompetence VALUES (NULL, @bigStation_ori_id, 
(SELECT id FROM Competence WHERE name ='natHostNation'), NULL, 3);


