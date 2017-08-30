# brcrimR

[![Travis-CI Build Status](https://travis-ci.org/azeloc/brcrimR.svg?branch=master)](https://travis-ci.org/azeloc/brcrimR)

Brazillian security offices maintain several sources of criminal information. Very often, those sources are not user friendly and don't give an explict way to build historical databases.

This packages provides a tidy and (almost) unified framework for accessing those informations. 

# Basic usage

Today, this package scrapes information only in São Paulo. As an example, we can obtain crime statistics for the county of São Paulo using

```{r}
brcrimR::get_summarized_table_sp(year = '2017', city = '0')
```

São Paulo's Security Office also disponibilize detailed information on the crime reports that originated the table above. One can obtain such information using

```{r}
brcrimR::get_detailed_table_sp(folder = 'btnHomicicio',
#this is not a typo
year = '2017', month = '1', department = '0')
```

# TODO

- [ ] Use testthat
- [ ] São Paulo
    - [X] Implement `get_summarized_table`
    - [X] Implement `get_detailed_table`
    - [ ] Document `get_summarized_table`
    - [ ] Document `browse`
    - [ ] Implement police district scraping on `get_summarized_table`
    - [ ] Implement other filters on `get_detailed_table`
    - [ ] Check if there's a way to not use `tempfile()` on `open_table()`
- [ ] Rio
- [ ] Espírito Santo
