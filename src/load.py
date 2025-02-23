from typing import Dict

from pandas import DataFrame
from sqlalchemy.engine.base import Engine


def load(data_frames: Dict[str, DataFrame], database: Engine):
    """Load the dataframes into the sqlite database.

    Args:
        data_frames (Dict[str, DataFrame]): A dictionary with keys as the table names
        and values as the dataframes.
    """
    for table_name, df in data_frames.items():
        try:
            df.to_sql(name=table_name, con=database, if_exists='replace', index=False)
            print(f"Loaded dataframe into table '{table_name}' succesfully.")
        except Exception as e:
            print(f"Failed to load dataframe into table '{table_name}': {e}")
            raise