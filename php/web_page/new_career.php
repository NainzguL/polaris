<?php
require_once('render/render_engine.php');

$t = new RenderEngine();
$t->setTitle("Métier");
$t->setHeaderAddition('
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
');
$t->setOtherScriptAddtion('
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<script type="text/javascript" language="javascript" src="scripts/uiCommon.js"></script>
<script type="text/javascript" language="javascript" src="i18n/fr-FR.js"></script>
<script type="text/javascript" language="javascript" src="scripts/comp.js"></script>
<script type="text/javascript" language="javascript" src="scripts/career.js"></script>
<script type="text/javascript" language="javascript" src="scripts/new_career.js"></script>
');

$t->renderHtmlTop();

include "html/new_career.html";

$t->renderHtmlBottom();
?>


