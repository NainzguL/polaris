USE polaris;


SET @soc_ori_type_id = (SELECT id FROM OriginType WHERE name = 'social');


INSERT INTO Origin VALUES (NULL, 'ghetto', @soc_ori_type_id);
SET @ghetto_soc_ori_id = (SELECT id FROM Origin WHERE name = 'ghetto');

INSERT INTO OriginCompetence VALUES (NULL, @ghetto_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='unarmedStruggle'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @ghetto_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='armedStruggle'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @ghetto_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='pickpocket'), NULL, 2);

SET @choise_groupe_ghetto_1 = '';
INSERT INTO OriginChoiceGroup VALUES (NULL);
SELECT LAST_INSERT_ID() INTO @choise_groupe_ghetto_1;

INSERT INTO OriginCompetence VALUES (NULL, @ghetto_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='intimidation'), @choise_groupe_ghetto_1, 1);
INSERT INTO OriginCompetence VALUES (NULL, @ghetto_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='dissimulation'), @choise_groupe_ghetto_1, 1);


INSERT INTO Origin VALUES (NULL, 'workingClass', @soc_ori_type_id);
SET @workingClass_soc_ori_id = (SELECT id FROM Origin WHERE name = 'workingClass');

INSERT INTO OriginCompetence VALUES (NULL, @workingClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='education'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @workingClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='unarmedStruggle'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @workingClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='underwaterBattlesuits'), NULL, 1);

SET @choise_groupe_workingClass_1 = '';
INSERT INTO OriginChoiceGroup VALUES (NULL);
SELECT LAST_INSERT_ID() INTO @choise_groupe_workingClass_1;

INSERT INTO OriginCompetence VALUES (NULL, @workingClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='mechanicsLifeSupport'), @choise_groupe_workingClass_1, 2);
INSERT INTO OriginCompetence VALUES (NULL, @workingClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='mechanicsMachinery'), @choise_groupe_workingClass_1, 2);
INSERT INTO OriginCompetence VALUES (NULL, @workingClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='mechanicsVehicle'), @choise_groupe_workingClass_1, 2);
INSERT INTO OriginCompetence VALUES (NULL, @workingClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='mechanicsBattleSuits'), @choise_groupe_workingClass_1, 2);
INSERT INTO OriginCompetence VALUES (NULL, @workingClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='farming'), @choise_groupe_workingClass_1, 2);


INSERT INTO Origin VALUES (NULL, 'mediumClass', @soc_ori_type_id);
SET @mediumClass_soc_ori_id = (SELECT id FROM Origin WHERE name = 'mediumClass');

INSERT INTO OriginCompetence VALUES (NULL, @mediumClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='bureaucracy'), NULL, 1);
INSERT INTO OriginCompetence VALUES (NULL, @mediumClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='education'), NULL, 2);
INSERT INTO OriginCompetence VALUES (NULL, @mediumClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='natHostNation'), NULL, 1);


INSERT INTO Origin VALUES (NULL, 'highClass', @soc_ori_type_id);
SET @highClass_soc_ori_id = (SELECT id FROM Origin WHERE name = 'highClass');

INSERT INTO OriginCompetence VALUES (NULL, @highClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='education'), NULL, 2);

SET @choise_groupe_highClass_1 = '';
INSERT INTO OriginChoiceGroup VALUES (NULL);
SELECT LAST_INSERT_ID() INTO @choise_groupe_highClass_1;

INSERT INTO OriginCompetence VALUES (NULL, @highClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='education'), @choise_groupe_highClass_1, 3);
INSERT INTO OriginCompetence VALUES (NULL, @highClass_soc_ori_id, 
(SELECT id FROM Competence WHERE name ='natHostNation'), @choise_groupe_highClass_1, 3);

