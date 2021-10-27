

# rasgo_lag

Lag shifts your features on a partition index, creating a lookback feature offset by an amount. Lag supports generating multiple lags in one transform by generating each unique combination of columns and amounts from your inputs.

## Parameters

| Argument  |    Type     |                                                                     Description                                                                     |
| --------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| columns   | column_list | names of column(s) you want to lag                                                                                                                  |
| amounts   | value_list  | Magnitude of amounts you want to use for the lag. Positive values result in a historical offset; negative amounts result in forward-looking offset. |
| partition | column_list | name of column(s) to partition by for the lag                                                                                                       |
| order_by  | column_list | name of column(s) to order by in the final data set                                                                                                 |


## Example

```python
source = rasgo.read.source_data(source.id)

t1 = source.transform(
  transform_name='rasgo_lag',
  columns = ['OPEN','CLOSE'],
  amounts = [1,2,3,7],
  order_by = ['DATE', 'TICKER'],
  partition = ['TICKER'])

t1.preview()
```

## Source Code

{% embed url="https://github.com/rasgointelligence/RasgoUDTs/tree/main/column_transforms/rasgo-lag/rasgo-lag.sql" %}
