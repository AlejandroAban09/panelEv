<?php
/* forms */
/**********************************************************************************************************************/
/*************************** Inicio Helpers 06-10-2016  (_*-*)_  ******************************************************/
/**********************************************************************************************************************/
/* inicio Helpers 06-10-2016 */


if (! function_exists('permisos'))
{
    function permisos($index){
       $allowed =
       array(
        "debug" => array(array(1,2,3,4,5,6,7,8,9,10,11,12,13), array(1,2,3,4,5,6,7,8,9,10,11,12,13)),
        "dashboard" => array(array(1,2), array(1,2)),
        "usuarios" => array(array(1), array(1)),
        "clientes" => array(array(1), array(1)),
        "pedidos" => array(array(1,2,3,4,7), array(1,2,3,4,7)),
        "pedidospendientes" => array(array(1), array(1)),
        "actualizar" => array(array(1), array(1)),
        "rdia" => array(array(1,3,7), array(1,3,7)),
        "rtotales" => array(array(1,3,7), array(1,3,7)),
        "racumulado" => array(array(1,3,7), array(1,3,7)),
        "rproducto" => array(array(1,7), array(1,7)),
        "rcliente" => array(array(1,7), array(1,7)),
        "rtoproductos" => array(array(1,7), array(1,7)),
        "rtienda" => array(array(1,7), array(1,7)),
        "rhistorico" => array(array(1,7), array(1,7)),
        "emails" => array(array(1,3,5), array(1,3,5)),
        "mailchimp" => array(array(1,3,5), array(1,3,5)),
        "empleados" => array(array(1,3), array(1,3)),
        "productossugeridos" => array(array(1,3), array(1,3)),
        "productosespeciales" => array(array(6), array(6)), //rol = prodsespeciales
        "accederaguinaldo" => array(array(1), array(1)),
        "tiendas" => array(array(1), array(1))
        );
       //$index='debug';
       return $allowed[$index];
    }
}

if (! function_exists('sesiones'))
{
     function sesiones($segment="",$rol=0,$allowed=array())
    {
       //Validación de usuarios
       $key_function=(!in_array($rol, $allowed[0])) ? redirect('denegado') : "";
       return $allowed;
    }
}

if (! function_exists('formInput'))
{
    function formInput($name,$leyenda = '',$placeholder='',$value=null,$error=null,$required=true,$clase='', $extra=''){
        $data['name'] = $name;
        $data['leyenda'] = $leyenda;
        $data['placeholder'] = $placeholder;
        $data['value'] = $value;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "Text";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;
    }
}

if (! function_exists('formInputPassword'))
{
    function formInputPassword($name,$leyenda = '',$placeholder='',$value=null,$error=null,$required=true,$clase='', $extra=''){
        $data['name'] = $name;
        $data['leyenda'] = $leyenda;
        $data['placeholder'] = $placeholder;
        $data['value'] = $value;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "Password";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;

    }
}

if (! function_exists('formTextArea'))
{
    function formTextArea($name,$leyenda= '',$placeholder='',$value=null,$error=null,$required=true,$clase='', $extra=''){
        $data['name'] = $name;
        $data['leyenda'] = $leyenda;
        $data['placeholder'] = $placeholder;
        $data['value'] = $value;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "Textarea";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;

    }
}

if (! function_exists('formCheckedActivo'))
{
    function formCheckedActivo($name,$value=1,$clase='',$leyenda = 'Estatus'){
        switch($value){
            case 1:
                $checkedActivo ='checked="checked"';
                $classActivo = 'class="checked"';
                $checkedInactivo ='';
                break;
            case 0:
                $checkedActivo ='';
                $classActivo = '';
                $checkedInactivo ='checked="checked"';
                break;
        }
        $html = '
            <div class="form-group box-body">
            <label for="'.$name.'_radio">'.$leyenda.'</label>
            <div class="demo-radio-button">
                <div class="md-radio">
                    <input name="'.$name.'" type="radio" id="'.$name.'1" class="radio-col-primary" value="1" '.$checkedActivo.'>
                    <label for="'.$name.'1">
                     Activo
                    </label>
                </div>
                <div class="md-radio">
                    <input name="'.$name.'" type="radio" id="'.$name.'2" class="radio-col-primary" value="0" '.$checkedInactivo.'>
                    <label for="'.$name.'2">
                        Inactivo
                    </label>
                </div>
            </div>
        </div>
        ';
        return $html;
    }
}

if (!function_exists('createSelect')) {
    function createSelect($name, $values, $leyenda = '', $placeholder = '', $selected = NULL, $error = NULL, $required = true, $clase = '', $extra = '')
    {
        $data['name'] = $name;
        $data['values'] = $values;
        $data['leyenda'] = $leyenda;
        $data['placeholder'] = $placeholder;
        $data['selected'] = $selected;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "createSelect";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;

    }
}

if (! function_exists('createSelectResult'))
{
      function createSelectResult($name,$values,$leyenda='',$placeholder='',$selected = NULL,$error = NULL, $required=true, $clase='', $extra = ''){

        $data['name'] = $name;
        $data['values'] = $values;
        $data['leyenda'] = $leyenda;
        $data['placeholder'] = $placeholder;
        $data['selected'] = $selected;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "createSelectResult";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;

    }
}

if (! function_exists('createSelectResultMultiple'))
{
      function createSelectResultMultiple($name,$values,$leyenda='',$selected = NULL,$error = NULL, $required=true, $clase='', $extra = ''){

        $data['name'] = $name;
        $data['values'] = $values;
        $data['leyenda'] = $leyenda;
        $data['selected'] = $selected;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "createSelectResultMultiple";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;

    }
}

if (! function_exists('createSelectResultName'))
{
      function createSelectResultName($name,$values,$leyenda='',$placeholder='',$selected = NULL,$error = NULL, $required=true, $clase='', $extra = ''){

        $data['name'] = $name;
        $data['values'] = $values;
        $data['leyenda'] = $leyenda;
        $data['placeholder'] = $placeholder;
        $data['selected'] = $selected;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "createSelectResultName";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;

    }
}

if ( !function_exists('acciones')) {
    function acciones($id,$ruta,$ver = false,$editar = true,$borrar=true) {
        $data['id'] = $id;
        $data['ruta'] = $ruta;
        $data['ver'] = $ver;
        $data['editar'] = $editar;
        $data['borrar'] = $borrar;

        $CI = &get_instance();

        $acciones = $CI->load->view('tools/acciones',$data,true);

        return $acciones;
    }
}

if ( !function_exists('fotoTable'))
{
    function fotoTable($foto,$thum,$ruta)
    {
        $saccion ='
                    <a class="magnificPopup" href="'.$ruta.'/'.$foto.'">
                        <img width="45" src="'.$ruta.'/'.$thum.'">
                    </a>';

        return $saccion;
    }
}
/**********************************************************************************************************************/
/*************************** Fin Helpers 06-10-2016  _(*-*_)  *********************************************************/
/**********************************************************************************************************************/
/* Old Helpers*/

if (! function_exists('formInputShort'))
{
    function formInputShort($id,$name,$value=null,$clase='',$leyenda = ''){
        $html = '
        <div class="form-group">
            <div class="col-md-12">
                <label class="form-label col-md-4" for="'.$id.'">'.$leyenda.'</label>
                <div class="col-md-8">
                    <input class="form-control '.$clase.'" id="'.$id.'" type="text" name="'.$name.'" value="'.$value.'" />
                </div>
            </div>
        </div>
        ';
        return $html;
    }
}

if (! function_exists('formInputSimple'))
{
    function formInputSimple($name,$value=null,$clase='',$leyenda = '',$extra=''){
        $html = '
        <div class="input-group">
            <span class="input-group-text"><i class="fa fa-usd"></i></span>
            <input type="text" class="form-control '.$clase.'" id="'.$name.'"  name="'.$name.'" placeholder="'.$leyenda.'" value="'.$value.'" '.$extra.'>
        </div>
        ';
        return $html;
    }
}

if (! function_exists('datePicker'))
{
    function datePicker($id,$name,$value=null,$clase='',$leyenda = ''){
        $html = '
                <div class="form-group">
                    <div class="col-lg-12">
                        <label class="form-label col-lg-4" for="'.$id.'">'.$leyenda.'</label>
                        <div class="col-lg-8">
                            <input class="form-control datepicker '.$clase.'" id="'.$id.'" type="text" name="'.$name.'" value="'.$value.'" />
                        </div>
                    </div>
                </div>
                ';
        return $html;
    }
}

if (! function_exists('html2text'))
{
    function html2text($html){
        $text = $html;
        static $search = array(
            '@<script.+?</script>@usi',  // Strip out javascript content
            '@<style.+?</style>@usi',    // Strip style content
            '@<!--.+?-->@us',            // Strip multi-line comments including CDATA
            '@</?[a-z].*?\>@usi',         // Strip out HTML tags
        );
        $text = preg_replace($search, ' ', $text);
        // normalize common entities
        $text = normalizeEntities($text);
        // decode other entities
        $text = html_entity_decode($text, ENT_QUOTES, 'utf-8');
        // normalize possibly repeated newlines, tabs, spaces to spaces
        $text = preg_replace('/\s+/u', ' ', $text);
        $text = trim($text);
        return $text;
    }
}

if (! function_exists('normalizeEntities'))
{
    function normalizeEntities($text) {
        static $find = array();
        static $repl = array();
        if (!count($find)) {
            // build $find and $replace from map one time
            $map = array(
                array('\'', 'apos', 39, 'x27'), // Apostrophe
                array('\'', '‘', 'lsquo', 8216, 'x2018'), // Open single quote
                array('\'', '’', 'rsquo', 8217, 'x2019'), // Close single quote
                array('"', '“', 'ldquo', 8220, 'x201C'), // Open double quotes
                array('"', '”', 'rdquo', 8221, 'x201D'), // Close double quotes
                array('\'', '‚', 'sbquo', 8218, 'x201A'), // Single low-9 quote
                array('"', '„', 'bdquo', 8222, 'x201E'), // Double low-9 quote
                array('\'', '′', 'prime', 8242, 'x2032'), // Prime/minutes/feet
                array('"', '″', 'Prime', 8243, 'x2033'), // Double prime/seconds/inches
                array(' ', 'nbsp', 160, 'xA0'), // Non-breaking space
                array('-', '‐', 8208, 'x2010'), // Hyphen
                array('-', '–', 'ndash', 8211, 150, 'x2013'), // En dash
                array('--', '—', 'mdash', 8212, 151, 'x2014'), // Em dash
                array(' ', ' ', 'ensp', 8194, 'x2002'), // En space
                array(' ', ' ', 'emsp', 8195, 'x2003'), // Em space
                array(' ', ' ', 'thinsp', 8201, 'x2009'), // Thin space
                array('*', '•', 'bull', 8226, 'x2022'), // Bullet
                array('*', '‣', 8227, 'x2023'), // Triangular bullet
                array('...', '…', 'hellip', 8230, 'x2026'), // Horizontal ellipsis
                array('°', 'deg', 176, 'xB0'), // Degree
                array('€', 'euro', 8364, 'x20AC'), // Euro
                array('¥', 'yen', 165, 'xA5'), // Yen
                array('£', 'pound', 163, 'xA3'), // British Pound
                array('©', 'copy', 169, 'xA9'), // Copyright Sign
                array('®', 'reg', 174, 'xAE'), // Registered Sign
                array('™', 'trade', 8482, 'x2122') // TM Sign
            );
            foreach ($map as $e) {
                for ($i = 1; $i < count($e); ++$i) {
                    $code = $e[$i];
                    if (is_int($code)) {
                        // numeric entity
                        $regex = "/&(amp;)?#0*$code;/";
                    }
                    elseif (preg_match('/^.$/u', $code)/* one unicode char*/) {
                        // single character
                        $regex = "/$code/u";
                    }
                    elseif (preg_match('/^x([0-9A-F]{2}){1,2}$/i', $code)) {
                        // hex entity
                        $regex = "/&(amp;)?#x0*" . substr($code, 1) . ";/i";
                    }
                    else {
                        // named entity
                        $regex = "/&(amp;)?$code;/";
                    }
                    $find[] = $regex;
                    $repl[] = $e[0];
                }
            }
        } // end first time build
        return preg_replace($find, $repl, $text);
    }
}

if (! function_exists('getVideo'))
{
    function getVideo($videoy){

        $video = $videoy;
        $video = str_replace("<p>", "", $video);
        $video = str_replace("</p>", "", $video);

        $cad = substr($video,0,13);
        $cadf = html2text($cad);
        if ($cadf == "<iframe"){
            echo html_entity_decode($video);
        } else {

            $videoFormat = $video; // html2text($v->video);
            $tipoVideo = explode ('/',$videoFormat);
            if ($tipoVideo[2] == 'youtu.be'){
                $explode = explode('/',$videoFormat);
                $link = '<iframe src="//www.youtube.com/embed/'.$explode[3].'"></iframe>';
            } else {
                $explode = explode('/',$videoFormat);
                $link = "<iframe src='http://player.vimeo.com/video/".$explode[3]."?portrait=0;api=1' height='281'   webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>";
            }

        }

        return $link;
    }
}

if ( !function_exists('string_fecha'))
{
    function string_fecha()
    {
        $today = getdate();
        $tomorrow = getdate(strtotime("+12 days"));
        return $fecha = $today['mday'].' de '.convertirmes($today['mon']).' de '.$today['year'];
    }
}


if (! function_exists('createSelectNormal'))
{
      function createSelectNormal($name,$values,$selected = NULL,$clase='',$leyenda='', $extra = ''){
        $html = '<select size="1" id="'.$name.'" name="'.$name.'" class="'.$clase.'" '.$extra.'>';
          if ($leyenda==''){
              $html .= '<option value="" selected="selected">Seleccione</option>';
          } else {
              $html .= '<option value="" selected="selected">'.$leyenda.'</option>';
          }
        foreach($values as $k=>$v){
            if($k == $selected){
                $html .= '<option value="'.$k.'" selected="selected" >'.$v.'</option>';
            } else {
                $html .= '<option value="'.$k.'">'.$v.'</option>';
            }
        }
        $html .='</select>';
        return $html;
        }
}


//Drop_down_urls
if (! function_exists('createSelectResultURL'))
{
      function createSelectResultURL($name,$values,$selected = NULL,$clase=''){
        $html = '<select id="'.$name.'" name="'.$name.'" class="'.$clase.'">';
        $html .= '<option value="todas" >Todas</option>';
        foreach($values->result() as $valor){
            if($valor->url == $selected){
                $html .= '<option value="'.$valor->url.'" selected="selected">'.$valor->titulo.'</option>';
            }else{
                $html .= '<option value="'.$valor->url.'">'.$valor->titulo.'</option>';
            }
        }
        $html .='</select>';
        return $html;
        }
}

if (! function_exists('createChecks'))
{
    function createChecks($values,$key,$value,$checked =array(),$clase=''){
        $html ="";
        foreach($values->result() as $evento)
        {
            if(in_array($evento->$key,$checked))
            {

                $html.= '<input type="checkbox" name="evento[]" value="'.$evento->$key.'" checked="checked" class="'.$clase.'"/>'.$evento->$value.'<br />';
            }else{
                $html.= '<input type="checkbox" name="evento[]" value="'.$evento->$key.'" class="'.$clase.'"/>'.$evento->$value.'<br />';
            }
        }
    return $html;
    }
}

if (! function_exists('getThumb'))
{

    function getThumb($imagen)
    {
        $thumb='';
        if($imagen!=''){
            $nimagen = explode(".", $imagen);
            $imagenname = $nimagen[0];
            $imagenext = $nimagen[1];
            $imagenname = $imagenname.'_thumb';
            $thumb      = $imagenname.'.'.$imagenext;
        }
        return $thumb;
    }
}

if (! function_exists('createRadios'))
{
    function createRadios($name,$values,$selected = NULL,$clase=''){
        $html = '';
        foreach($values as $k=>$v){
            if($v == $selected){
                $html .= '<input type="radio" name="'.$name.'" value="'.$v.'" checked="checked" />'.$v.'<br/>';
            }else{
                $html .= '<input type="radio" name="'.$name.'" value="'.$v.'"  />'.$v.'<br/>';
            }
        }
        return $html;
    }
}


/**
 * Present value interest factor
 *
 *                 nper
 * PVIF = (1 + rate)
 *
 * @param  float   $rate is the interest rate per period.
 * @param  integer $nper is the total number of periods.
 * @return float  the present value interest factor
 */
function _calculate_pvif ($rate, $nper)
{
    return (pow(1 + $rate, $nper));
}


if (! function_exists('createRadiosLabel'))
{
    function createRadiosLabel($name,$values,$selected = NULL,$clase=''){
        $html = '';
        $count = 0;
        foreach($values as $k=>$v){
            $count++;
            if($k == $selected){
                $html .= '<input type="radio" name="'.$name.'" value="'.$k.'" id="'.$name.'-'.$count.'" checked="checked" /> <label for="'.$name.'-'.$count.'">'.$v.'</label>';
            }else{
                $html .= '<input type="radio" name="'.$name.'" value="'.$k.'"  id="'.$name.'-'.$count.'" /><label for="'.$name.'-'.$count.'">'.$v.'</label>';
            }
        }
        return $html;
    }
}


if (! function_exists('convertirMes'))
{
    function convertirMes($mes){
        switch($mes){
                case 1:$mes='Enero';break;case 2:$mes='Febrero';break;case 3:$mes='Marzo';break;case 4:$mes='Abril';break;case 5:$mes='Mayo';break;case 6:$mes='Junio';break;case 7:$mes='Julio';break;case 8:$mes='Agosto';break;case 9:$mes='Septiembre';break;case 10:$mes='Octubre';break;case 11:$mes='Noviembre';break;case 12:$mes='Diciembre';break;
        }
        return $mes;
    }

}

if (! function_exists('convertMes'))
{
    function convertMes($fecha)
    {
        if($fecha!="")
        {
            $f_array = explode('-',$fecha);
            switch($f_array[1]){
                case '01':
                    $f_return = $f_array[2].'-Ene-'.$f_array[0];
                break;
                case '02':
                    $f_return = $f_array[2].'-Feb-'.$f_array[0];
                break;
                case '03':
                    $f_return = $f_array[2].'-Mar-'.$f_array[0];
                break;
                case '04':
                    $f_return = $f_array[2].'-Abr-'.$f_array[0];
                break;
                case '05':
                    $f_return = $f_array[2].'-May-'.$f_array[0];
                break;
                case '06':
                    $f_return = $f_array[2].'-Jun-'.$f_array[0];
                break;
                case '07':
                    $f_return = $f_array[2].'-Jul-'.$f_array[0];
                break;
                case '08':
                    $f_return = $f_array[2].'-Ago-'.$f_array[0];
                break;
                case '09':
                    $f_return = $f_array[2].'-Sep-'.$f_array[0];
                break;
                case '10':
                    $f_return = $f_array[2].'-Oct-'.$f_array[0];
                break;
                case '11':
                    $f_return = $f_array[2].'-Nov-'.$f_array[0];
                break;
                case '12':
                    $f_return = $f_array[2].'-Dic-'.$f_array[0];
                break;
            }
            return $f_return;
        }
    }
}
if (! function_exists('h_money_format'))
{
    function h_money_format($format, $number)
    {
        $regex  = '/%((?:[\^!\-]|\+|\(|\=.)*)([0-9]+)?'.
                  '(?:#([0-9]+))?(?:\.([0-9]+))?([in%])/';
        if (setlocale(LC_MONETARY, 0) == 'C') {
            setlocale(LC_MONETARY, '');
        }
        $locale = localeconv();
        preg_match_all($regex, $format, $matches, PREG_SET_ORDER);
        foreach ($matches as $fmatch) {
            $value = floatval($number);
            $flags = array(
                'fillchar'  => preg_match('/\=(.)/', $fmatch[1], $match) ?
                               $match[1] : ' ',
                'nogroup'   => preg_match('/\^/', $fmatch[1]) > 0,
                'usesignal' => preg_match('/\+|\(/', $fmatch[1], $match) ?
                               $match[0] : '+',
                'nosimbol'  => preg_match('/\!/', $fmatch[1]) > 0,
                'isleft'    => preg_match('/\-/', $fmatch[1]) > 0
            );
            $width      = trim($fmatch[2]) ? (int)$fmatch[2] : 0;
            $left       = trim($fmatch[3]) ? (int)$fmatch[3] : 0;
            $right      = trim($fmatch[4]) ? (int)$fmatch[4] : $locale['int_frac_digits'];
            $conversion = $fmatch[5];

            $positive = true;
            if ($value < 0) {
                $positive = false;
                $value  *= -1;
            }
            $letter = $positive ? 'p' : 'n';

            $prefix = $suffix = $cprefix = $csuffix = $signal = '';

            $signal = $positive ? $locale['positive_sign'] : $locale['negative_sign'];
            switch (true) {
                case $locale["{$letter}_sign_posn"] == 1 && $flags['usesignal'] == '+':
                    $prefix = $signal;
                    break;
                case $locale["{$letter}_sign_posn"] == 2 && $flags['usesignal'] == '+':
                    $suffix = $signal;
                    break;
                case $locale["{$letter}_sign_posn"] == 3 && $flags['usesignal'] == '+':
                    $cprefix = $signal;
                    break;
                case $locale["{$letter}_sign_posn"] == 4 && $flags['usesignal'] == '+':
                    $csuffix = $signal;
                    break;
                case $flags['usesignal'] == '(':
                case $locale["{$letter}_sign_posn"] == 0:
                    $prefix = '(';
                    $suffix = ')';
                    break;
            }
            if (!$flags['nosimbol']) {
                $currency = $cprefix .
                            ($conversion == 'i' ? $locale['int_curr_symbol'] : $locale['currency_symbol']) .
                            $csuffix;
            } else {
                $currency = '';
            }
            $space  = $locale["{$letter}_sep_by_space"] ? ' ' : '';

            $value = number_format($value, $right, $locale['mon_decimal_point'],
                     $flags['nogroup'] ? '' : $locale['mon_thousands_sep']);
            $value = @explode($locale['mon_decimal_point'], $value);

            $n = strlen($prefix) + strlen($currency) + strlen($value[0]);
            if ($left > 0 && $left > $n) {
                $value[0] = str_repeat($flags['fillchar'], $left - $n) . $value[0];
            }
            $value = implode($locale['mon_decimal_point'], $value);
            if ($locale["{$letter}_cs_precedes"]) {
                $value = $prefix . $currency . $space . $value . $suffix;
            } else {
                $value = $prefix . $value . $space . $currency . $suffix;
            }
            if ($width > 0) {
                $value = str_pad($value, $width, $flags['fillchar'], $flags['isleft'] ?
                         STR_PAD_RIGHT : STR_PAD_LEFT);
            }

            $format = str_replace($fmatch[0], $value, $format);
        }
        return $format;
    }
}

if ( !function_exists('editar_foto'))
{
    function editar_foto($id,$ruta)
    {
        echo "
            <a href=\"$ruta/editar/$id\">
                <span class=\"icon-pencil\"></span>
                Editar
            </a>
            ";
    }
}

if ( !function_exists('titulo_seccion'))
{
    function titulo_seccion($name)
    {
        $name=  ucfirst ( $name);
        echo "<div class=\"title\">
                <h4>
                    <img src=\"images/section-icon.png\" width=\"20px\" >
                    <span>$name</span>
                </h4>
            </div>";
    }
}

if ( !function_exists('getSexo'))
{
    function getSexo($value = null){
        if ($value!= null){

            switch($value){

                case 0:
                    $seccion ='Masculino';

                    break;
                case 1:
                    $seccion ='Femenino';
                    break;

                default:
                    $seccion ='';
            }
        }else{
            $seccion = '';
        }
        return $seccion;
    }
}
// leyenda la imagen debe ser
if ( !function_exists('getLeyenda'))
{
    function getLeyenda($id){

        switch ($id) {                                                         
            case 3:
                $leyenda= "La imagen debe ser de 555 x 430";
                break;
            case 4:
                $leyenda= "La imagen debe ser de 555 x 178";
                break;
            case 5:
                $leyenda= "La imagen debe ser de 555 x 220";
                break;                                                            
            case 6:
                $leyenda= "La imagen debe ser de 370 x 230";
                break;
            case 7:
                $leyenda= "La imagen debe ser de 370 x 230";
                break; 
            case 8:
                $leyenda= "La imagen debe ser de 370 x 230";
                break;
        }  
        return $leyenda;
    }
}

if ( !function_exists('addhttp'))
{
    function addhttp($url) {
        if (!preg_match("~^(?:f|ht)tps?://~i", $url)) {
            $url = "http://" . $url;
        }
        return $url;
    }
}

if (! function_exists('getMes'))
{
    function getMes($fecha)
    {
        if($fecha!="")
        {
            $mes = '';
            switch($fecha){
                case 1:
                    $mes = 'Enero';
                break;
                case 2:
                    $mes = 'Febrero';
                break;
                case 3:
                    $mes = 'Marzo';
                break;
                case 4:
                    $mes = 'Abril';
                break;
                case 5:
                    $mes = 'Mayo';
                break;
                case 6:
                    $mes = 'Junio';
                break;
                case 7:
                    $mes = 'Julio';
                break;
                case 8:
                    $mes = 'Agosto';
                break;
                case 9:
                    $mes = 'Septiembre';
                break;
                case 10:
                    $mes = 'Octubre';
                break;
                case 11:
                    $mes = 'Noviembre';
                break;
                case 12:
                    $mes = 'Diciembre';
                break;
            }
            return $mes;
        }
    }
}

if (! function_exists('getRol'))
{
    function getRol($rol)
    {
        if($rol!="")
        {
            $tituloRol = '';
            switch($rol){
                case 0:
                    $tituloRol = 'Super Usuario';
                break;
                case 1:
                    $tituloRol = 'Admin';
                break;
                case 2:
                    $tituloRol = 'Usuario';
                break;
                default:
                   $tituloRol = 'Super Usuario';
                break;
            }
        }
            return $tituloRol;
    }
}

if (!function_exists('get_fecha'))
{
    function get_fecha($fecha)
    {
        $long = strlen($fecha);
            if ($long > 4){ $fecha = str_replace('/','-',$fecha);
                $time = date("l j \of F Y", strtotime("$fecha"));
                $time = str_replace('of','de',$time);
                $search = array('January','February','March','April','May','June','July','August', 'September', 'October', 'November', 'December');
                $replace = array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre');
                $search2 = array('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');
                //$replace2 = array('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo');
                $replace2 = array('','','','','','','');
                $time = str_replace($search, $replace, $time);
                $time = str_replace($search2, $replace2, $time);

                return $time;

            }else{
                return $fecha;
            }
    }
}


if (! function_exists('createSelectResult2'))
{
      function createSelectResult2($name,$values,$leyenda='',$placeholder='',$selected = NULL,$error = NULL, $required=true, $clase='',$extra=''){

        $data['name'] = $name;
        $data['values'] = $values;
        $data['leyenda'] = $leyenda;
        $data['placeholder'] = $placeholder;
        $data['selected'] = $selected;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "createSelectResult2";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;

    }
}

if (! function_exists('formInputFile'))
{
    function formInputFile($name,$leyenda = '',$placeholder='',$value=null,$error=null, $required=true, $clase='', $extra=''){
        $data['name'] = $name;
        $data['leyenda'] = $leyenda;
        $data['placeholder'] = $placeholder;
        $data['value'] = $value;
        $data['error'] = $error;
        $data['required'] = $required;
        $data['spanRequired'] = ($required) ? '<span class="text-danger">*</span>' : '';
        $data['claseError'] = ($error != null) ? "has-error" : "";
        $data['clase'] = $clase;
        $data['extra'] = $extra;
        $data['input'] = "File";

        $CI = &get_instance();

        $html = $CI->load->view('tools/inputs',$data,true);

        return $html;

    }
}

if (!function_exists('diaEspaniol'))
{
    function diaEspaniol($dia){
        $abr = 'No es un día de la semana';
        if(is_numeric($dia)){
            switch($dia){
                case 1: $abr = 'Lun';
                    break;
                case 2: $abr = 'Mar';
                    break;
                case 3: $abr = 'Mié';
                    break;
                case 4: $abr = 'Jue';
                    break;
                case 5: $abr = 'Vie';
                    break;
                case 6: $abr = 'Sáb';
                    break;
                case 7: $abr = 'Dom';
                    break;
                default:
                    break;
            }
        }
        return $abr;
    }
}

if (!function_exists('mesEspaniol'))
{
    function mesEspaniol($mes){
        $abr = 'No es un mes existente.';
        if(is_numeric($mes)){
            switch($mes){
                case 1: $abr = 'Enero';
                    break;
                case 2: $abr = 'Febrero';
                    break;
                case 3: $abr = 'Marzo';
                    break;
                case 4: $abr = 'Abril';
                    break;
                case 5: $abr = 'Mayo';
                    break;
                case 6: $abr = 'Junio';
                    break;
                case 7: $abr = 'Julio';
                    break;
                case 8: $abr = 'Agosto';
                    break;
                case 9: $abr = 'Septiembre';
                    break;
                case 10: $abr = 'Octubre';
                    break;
                case 11: $abr = 'Noviembre';
                    break;
                case 12: $abr = 'Diciembre';
                    break;
                default:
                    break;
            }
        }
        return $abr;
    }
}

if (!function_exists('limitarTexto'))
{
    function limitarTexto($texto, $limite = 150, $sufijo = "...") {
        if (strlen($texto) <= $limite) return $texto;
    
        $cortado = substr($texto, 0, $limite);
        return substr($cortado, 0, strrpos($cortado, ' ')) . $sufijo;
    }
}