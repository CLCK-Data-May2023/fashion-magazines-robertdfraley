import os
import pandas as pd
import pytest

CSV_FILE = "data/fashion_magazines.csv"

def test_file_exists():
    assert os.path.exists(CSV_FILE) == True, "csv file does not exist"

def test_columns_exist():
    expected_columns = ['Customer','Amount Due']
    try:
        df = pd.read_csv(CSV_FILE)
        for col in expected_columns:
            assert col in df.columns
    except Exception as e:
        assert False, e

@pytest.mark.parametrize("expected_customer,expected_amount",
                        [["Bethann Schraub","$102.00"],
                        ["Eryn Vilar","$102.00"],
                        ["Janay Priolo","$57.00"],
                        ["Lizabeth Letsche","$237.00"]])
def test_values_exist(expected_customer, expected_amount):
    try:
        df = pd.read_csv(CSV_FILE)
        assert df.loc[df['Customer'] == expected_customer]['Amount Due'].iloc[0] == expected_amount
    except Exception as e:
        assert False, e