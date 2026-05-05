Analysis of email marketing campaign performance to identify factors influencing campaign success rate.

# Dataset
Dataset from Kaggle (Email Campaign Management for SME), 68353 records, columns such as: email status, customer location, total links, word count.

# Tools: 
Jupyter Notebook (Python), DBeaver (SQL).


# Key Findings
Campaign Type — Campaign Type 3 has a higher success rate than Campaign Type 2 (28.6% vs 11.4%). Campaign Type 1 was excluded from analysis due to insufficient sample size (563 emails vs 47k+).

Send Time — Time of sending has minimal impact on success rate (16.62% - 16.92%). Send time is not a significant factor in campaign effectiveness.

Email Length — Shorter emails perform significantly better. Emails under 524 words achieve a 26.9% success rate, while emails over 881 words drop to 10.2%. Recommended email length: under 525 words.

Number of Links — Emails with 6-15 links have the highest success rate (17.6%). More than 16 links reduces effectiveness to 15.3% — likely overwhelming recipients.

Customer Location — Location has minimal impact on success rate (16.0% - 17.4%). Campaigns perform consistently across all locations.
