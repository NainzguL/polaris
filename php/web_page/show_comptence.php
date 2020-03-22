<?php
require_once('render/render_engine.php');
require_once('db.php');
require_once('error.php');

$t = new RenderEngine();
$t->setTitle("Compétences");

$t->renderHtmlTop();

echo "<h1>All competences</h1>";
echo '<div class="alert alert-warning" role="alert">
        This page is a test. It may be removed in the future
      </div>';

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

while($rows=mysqli_fetch_array($resultCmp)){
    $cat_name = $rows['name'];
    echo $cat_name . "<br/>";
}

$resultCmp->close();
$conn->close();

$t->renderHtmlBottom();
?>
