<?php
function jsonGenerating()
{
    $answer = "";
    for ($i = 1; $i <= 100; $i++) {
        $answer .= "UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object(
            'product_id', round(RANDOM() * 100),
            'count', round(RANDOM() * 20))
            WHERE id =" . $i . ";" . "<br>";
    }


    return $answer;
}


var_dump(jsonGenerating());
