
import pandas as pd

# Function to check the prefixes in the corresponding columns
def check_prefixes(row):
    results = {
        "p__": row["Phylum"].startswith("p__") if pd.notna(row["Phylum"]) else False,
        "g__": row["Genus"].startswith("g__") if pd.notna(row["Genus"]) else False,
        "s__": row["Species"].startswith("s__") if pd.notna(row["Species"]) else False,
        "c__": row["Class"].startswith("c__") if pd.notna(row["Class"]) else False,
        "o__": row["Order"].startswith("o__") if pd.notna(row["Order"]) else False,
        "f__": row["Family"].startswith("f__") if pd.notna(row["Family"]) else False,
    }
    return results

# Function to reorganize the elements based on the prefixes
def reorganize_row(row):
    phylum = [val for val in row if pd.notna(val) and val.startswith("p__")]
    genus = [val for val in row if pd.notna(val) and val.startswith("g__")]
    species = [val for val in row if pd.notna(val) and val.startswith("s__")]
    class_ = [val for val in row if pd.notna(val) and val.startswith("c__")]
    order = [val for val in row if pd.notna(val) and val.startswith("o__")]
    family = [val for val in row if pd.notna(val) and val.startswith("f__")]

    row["Phylum"] = phylum[0] if phylum else None
    row["Genus"] = genus[0] if genus else None
    row["Species"] = species[0] if species else None
    row["Class"] = class_[0] if class_ else None
    row["Order"] = order[0] if order else None
    row["Family"] = family[0] if family else None
    return row

# Load the data
file_path = "./DF2.csv"
data = pd.read_csv(file_path)

# Analyzing the prefixes
results = data.apply(check_prefixes, axis=1)
results_df = pd.DataFrame(list(results))
summary = results_df.apply(lambda x: x.value_counts()).fillna(0).astype(int).T

# Reorganizing the data
reorganized_data = data.apply(reorganize_row, axis=1)

# Saving the reorganized data
output_csv_path = "./DF3.csv"
reorganized_data.to_csv(output_csv_path, index=False)
