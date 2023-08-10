<?php 
/**
 * Generate unique value for column
 * @param string $table
 * @param string $column
 * @return mixed
 */
if(! function_exists('unique'))
{
    function unique($table, $column)
    {
        $value = substr(md5(mt_rand()), 0, 8);
        $check = \Phplite\Database\Database::table($table)->where($column, '=', $value)->first();

        return $check ? unique($table, $column) : $value;
    }
}