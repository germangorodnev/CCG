var c = ds_list_size(argument0);
for (var i = 0; i < c; i++)
{
    var v = argument0[| i];
    if (ds_exists(v, ds_type_list))
        ds_list_destroy(v);
}

ds_list_destroy(argument0);




