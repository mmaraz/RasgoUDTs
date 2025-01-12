

# impute

Impute missing values in column/columns with the mean, median, mode, or a value

## Parameters

|     Argument      |      Type       |                                                                                         Description                                                                                         |
| ----------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| imputations       | imputation_dict | Dictionary with keys as column names to impute missing values for, and dictionary values the type of imputation stratgey ('mean', 'median', 'mode', <value>)                                |
| flag_missing_vals | boolean         | If True/set will create a new column for every one imputing that has 1 if column in the impuation dict was NULL, 0 if it wasn't. This columns will be named like '<col_name>_missing_flag'. |


## Example

```python
source.transform(
  transform_name='impute',
  imputations={
      'MONTH': 'mean',            # Impute with mean 
      'FIPS': 'median',           # Impute with median
      'COVID_NEW_CASES': 'mode',  # Impute with mode
      'YEAR': '2021',             # Impute with the string '2021'
      'COVID_DEATHS': 2.45,       # Impute with the float 2.45
      'IS_2021': False            # Impute with the bool False
  },
  flag_missing_vals=True
).preview()

```

## Source Code

{% embed url="https://github.com/rasgointelligence/RasgoUDTs/blob/main/column_transforms/impute/impute.sql" %}

