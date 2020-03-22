<?php
require_once('render/render_engine.php');

$t = new RenderEngine();
$t->setTitle("Fiche de personage");
$t->setHeaderAddition('
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="style/character_sheet.css">
');
$t->setOtherScriptAddtion('
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<script type="text/javascript" language="javascript" src="i18n/fr-FR.js"></script>
<script type="text/javascript" language="javascript" src="scripts/comp.js"></script> 
<script type="text/javascript" language="javascript" src="scripts/nations.js"></script>
<script type="text/javascript" language="javascript" src="scripts/geographicOrigin.js"></script>
<script type="text/javascript" language="javascript" src="scripts/socialOrigin.js"></script>
<script type="text/javascript" language="javascript" src="scripts/formationOrigin.js"></script>
<script type="text/javascript" language="javascript" src="scripts/schoolOrigin.js"></script>
<script type="text/javascript" language="javascript" src="scripts/uiCommon.js"></script> 
<script type="text/javascript" language="javascript" src="scripts/career.js"></script> 
<script type="text/javascript" language="javascript" src="scripts/character.js"></script> 
<script src="scripts/characterSheet.js"></script>
');

$t->renderHtmlTop();

include "html/character_sheet.html";

$t->renderHtmlBottom();
?>


