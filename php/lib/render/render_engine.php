<?php
class RenderEngine {
        
    protected $title = "polaris";
    protected $headerAddition = "";
    protected $otherScriptAddtion = "";
        
    public function __construct($template_dir = null) {
        if ($template_dir !== null) {
            // Check here whether this directory really exists
            $this->template_dir = $template_dir;
        }
    }
    
    public function render($template_file) {
        if (file_exists($this->template_dir.$template_file)) {
            include $this->template_dir.$template_file;
        } else {
            throw new Exception('no template file ' . $template_file . ' present in directory ' . $this->template_dir);
        }
    }
    
    public function renderHtmlTop() {
        include "web_page_top.phtml";
    }
    
    public function renderHtmlBottom() {
        include "web_page_bottom.phtml";
    }
    
    public function setTitle($titleArg) {
        $this->title = $titleArg;
    }
    
    public function getTitle() {
        return $this->title;
    }
    
    public function setHeaderAddition($headerAdditionArg) {
        $this->headerAddition = $headerAdditionArg;
    }
    
    public function getHeaderAddition() {
        return $this->headerAddition;
    }
    
    public function setOtherScriptAddtion($otherScriptAddtionArgArg) {
        $this->otherScriptAddtion = $otherScriptAddtionArgArg;
    }
    
    public function getOtherScriptAddtion() {
        return $this->otherScriptAddtion;
    }
}
?>