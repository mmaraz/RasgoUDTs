

# dedupe

Deduplicate a table based on a passed-in composite key. Once an order column and an order method are selected, only the top record from the resulting grouped and ordered dataset will be kept.

## Parameters

|   Argument   |    Type     |                                 Description                                  |
| ------------ | ----------- | ---------------------------------------------------------------------------- |
| natural_key  | column_list | Columns forming the grain at which to remove duplicates                      |
| order_col    | column_list | Columns by which to order the result set, such that the first result is kept |
| order_method | value       | Can be "desc" or "asc". Sets the order behavior for the chosen `order_col`.  |


## Example

```python
source = rasgo.read.source_data(source_id)

t1 = source.transform(
    transform_name='dedupe',
    natural_key=["FIPS", "DS_WEATHER_ICON", "DATE"],
    order_col=["DATE", "FIPS"],
    order_method="asc"
)

t1.preview()

```

## Source Code

{% embed url="https://github.com/rasgointelligence/RasgoUDTs/blob/main/table_transforms/dedupe/dedupe.sql" %}

