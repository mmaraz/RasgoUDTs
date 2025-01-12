

# join

Join a source table with another join table based on certain join keys between table. **NOTE**: For columns in the Join table with the same name in the source table, only the columns from the join table will be included in the output. 

## Parameters

|   Argument   |   Type    |                                                  Description                                                   |
| ------------ | --------- | -------------------------------------------------------------------------------------------------------------- |
| join_table   | source    | Source id of the table to join with the source one.                                                            |
| join_type    | string    | 'LEFT','RIGHT', 'INNER', or None                                                                               |
| join_columns | join_dict | Columns to use for the join. Keys are columns in the source_table and values are on columns in the join_table. |


## Example

```python
source.transform(
  transform_name='join',
  join_table=source.id,
  join_type='LEFT',
  join_columns={
    'MONTH':'MONTH',
    'TICKER':'TICKER'
  }
).preview()
```

## Source Code

{% embed url="https://github.com/rasgointelligence/RasgoUDTs/blob/main/table_transforms/join/join.sql" %}

