<?php
/**
This scrip repley read the competence from the cbds and return a json string 
that contain all the competences.
*/
require_once('db.php');
require_once('error.php');

/**
 * return the list of the given competence
 * 
 * @param $cmpName the competence
 * @param le list of the competence requirment. Result of: 
 * SELECT cmp.name AS cmp_name, requirement_cmp.name AS req_cmp_name, cmp_req.requirement_level 
 * FROM CompetenceRequirement AS cmp_req
 *   LEFT JOIN Competence AS cmp ON cmp_req.cmp_id = cmp.id
 *   LEFT JOIN Competence AS requirement_cmp ON cmp_req.requirement_cmp_id = requirement_cmp.id;
 */
function getCmpRequirmentName($cmpName, $arrayAllCmpRequirment) {
    $ret = array();
    foreach ($arrayAllCmpRequirment as &$row) {
        if ($row['cmp_name'] == $cmpName) {
            $ret[$row['req_cmp_name']] = intval($row['requirement_level']);
        }
    }
    return $ret;
}

$conn = createNewDbconnect();

$sqlCmp = "SELECT Competence.id, Competence.name, CompetenceCategories.name AS cat_name, Competence.base, Competence.attr1, Competence.attr2, Competence.limiting, Competence.naturalIncrease, CompetenceSet.name AS set_name FROM Competence
    LEFT JOIN CompetenceCategories
        ON CompetenceCategories.id = Competence.cat_id
    LEFT JOIN CompetenceSet
        ON CompetenceSet.id = Competence.set_id;";
$resultCmp = $conn->query($sqlCmp);
if (!$resultCmp) {
    reponse500InternalError("select fail; sql: " . $sqlCmp . " error: " . $conn->connect_error);
    exit();
}

$sqlCmpRequirment = "SELECT cmp.name AS cmp_name, requirement_cmp.name AS req_cmp_name, cmp_req.requirement_level 
  FROM CompetenceRequirement AS cmp_req
    LEFT JOIN Competence AS cmp ON cmp_req.cmp_id = cmp.id
    LEFT JOIN Competence AS requirement_cmp ON cmp_req.requirement_cmp_id = requirement_cmp.id;";
$resultCmpRequirment = $conn->query($sqlCmpRequirment);
if (!$resultCmpRequirment) {
    reponse500InternalError("select fail; sql: " . $sqlCmpRequirment . " error: " . $conn->connect_error);
    exit();
}
$cmpRequirment = $resultCmpRequirment->fetch_all(MYSQLI_ASSOC);

$data = array();
while($rows=mysqli_fetch_array($resultCmp)){
    $cat_name = $rows['cat_name'];
    if ($cat_name == 'bitchy') {
        continue;
    }
    $cmp_name = $rows['name'];
    if (!array_key_exists($cat_name,$data)) {
        $data[$cat_name] = array();
    }
    $data[$cat_name][$cmp_name] = array(
        "base" => $rows['base'] == null ? null : intval($rows['base']),
        "attr" => [$rows['attr1'], $rows['attr2']]
    );
    if ($rows['limiting']) {
        $data[$cat_name][$cmp_name]['limiting'] = true;
    }
    if ($rows['naturalIncrease']) {
        $data[$cat_name][$cmp_name]['naturalIncrease'] = true;
    }
    if ($rows['set_name']) {
        $data[$cat_name][$cmp_name]['set'] = $rows['set_name'];
    }
    $requirmentArray =  getCmpRequirmentName($rows['name'], $cmpRequirment);
    if (!empty($requirmentArray)) {
        $data[$cat_name][$cmp_name]['requirement'] = $requirmentArray;
    }
}

$resultCmpRequirment->close();
$resultCmp->close();
$conn->close();

header('Content-Type: application/json');
echo json_encode($data);

?>