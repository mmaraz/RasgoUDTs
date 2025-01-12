

# concat

This function creates a new column that concatenates fixed values and columns in your dataset.

Pass in a list named "concat_list", containing the names of the columns and the static string values to concatenate, in order.


## Parameters

|  Argument   |    Type    |                    Description                     |
| ----------- | ---------- | -------------------------------------------------- |
| concat_list | mixed_list | A list representing each new column to be created. |


## Example

```python
source = rasgo.read.source_data(source_id)

t1 = source.transform(
  transform_name='concat',
  concat_list=["DS_WEATHER_ICON", "'some_str'", "'_5'"]
)

t1.preview()

```

## Source Code

{% embed url="https://github.com/rasgointelligence/RasgoUDTs/blob/main/column_transforms/concat/concat.sql" %}

