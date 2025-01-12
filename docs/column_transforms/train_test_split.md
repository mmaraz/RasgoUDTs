

# train_test_split

Label rows as part of the train or test set based off of percentage split you want to apply to the data.

If you want a row-wise random sample applied, do not pass an order_by column. If you want an ordered split, then pass the order_by column.


## Parameters

|   Argument    |    Type     |                                                                       Description                                                                        |
| ------------- | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| order_by      | column_list | optional argument that affects the train/test split method applied. if needed, pass the names of column(s) you want to order by when applying the split. |
| train_percent | value       | Percent of the data you want in the train set, expressed as a decimal (i.e. .8). The rest of the rows will be included in the test set.                  |


## Example

```python
source = rasgo.read.source_data(source.id)

t1 = source.transform(
  transform_name='train_test_split',
  order_by = ['DATE'],
  train_percent = 0.8
)

t1 = source.transform(
  transform_name='train_test_split',
  train_percent = 0.8
)

t1.preview()
```

## Source Code

{% embed url="https://github.com/rasgointelligence/RasgoUDTs/blob/main/column_transforms/train_test_split/train_test_split.sql" %}

