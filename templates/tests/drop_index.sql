DROP INDEX vendors_vendor_name_idx{% if not pg %} ON vendors{% endif %};
