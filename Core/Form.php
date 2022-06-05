<?php
namespace App\Core;

class Form{
    private $formCode = '';
    /**
     * 
     */
    function create(){
        return $this->formCode;
    }
    
    /**
     *
     */
    static function validate(array $form, array $champs){
        $result = true;
        foreach($champs as $champ){
            if(!isset($form[$champ])||empty($form[$champ])){
                $result = false;
            }
            return $result;
        }
    }

    /**
     * 
     * 
     */
    public function setAttribute(array $attributes):string
    {
        $str = '';
        $courts = ['checked', 'disabled', 'readonly','required','novalidate','autofocus', 'formnovalidate'];
        foreach($attributes as $attribute=>$value){
            if(in_array($attribute,$courts) && $value == true){
                $str .= " $attribute";
            }else{
                $str .= " $attribute=\"$value\"";
            }
        }
        return $str;
    }

    /**
     * 
     * 
     */
    public function startForm(string $method = 'get', string $action = '.', array $attributes = []):self
    {
        $this->formCode = "<form action=\"$action\" method=\"$method\"";
        $this->formCode .= !empty($attributes)?$this->setAttribute($attributes).">\n":">\n";
        return $this;
    }

    /**
     * 
     */
    public function endForm():self
    {
        $token = md5(uniqid());
        $this->formCode .= "<input type=\"hidden\" name=\"token\" value=\"$token\"/>";
        $this->formCode .= '</form>';
        return $this;
    }

    /**
     * 
     */
    public function addLabel(string $text, string $for = '', array $attributes = []):self
    {
        $for = $for?" for=\"$for\"":"";
        $this->formCode .= "\t<label $for";
        $this->formCode .= !empty($attributes)?$this->setAttribute($attributes).'>':'>';
        $this->formCode .= "$text</label>\n";
        return $this;
    }

    /**
     * 
     */
    public function addInput(string $type = 'text', string $value = "", array $attributes = []):self
    {
        $this->formCode .= "\t<input type=\"$type\" value=\"$value\"";
        $this->formCode .= !empty($attributes)?$this->setAttribute($attributes)." />\n":" />\n";
        return $this;
    }
    
    /**
     * 
     */
    public function beginBlock(array $attributes = []):self
    {
        $this->formCode .= "\t<div";
        $this->formCode .= !empty($attributes)?$this->setAttribute($attributes).'>':'>';
        return $this;
    }
    /**
     * 
     */
    public function endBlock():self
    {
        $this->formCode .= "\t</div>";
        return $this;
    }
}