# Unifying Privacy Policy Detection Toolchain

This is the accompanying repository for the "Unifying Privacy Policy Detection" paper published in the [Pri­va­cy En­han­cing Tech­no­lo­gies Sym­po­si­um (PETS) 2021](https://petsymposium.org/2021/paperlist.php).

The aim of this project is to support privacy policy researchers with a unified solution for creating privacy policy corpora based on currently available best-practices. 

At the moment, we have uploaded the source code as a proof of concept, according with the trained classifiers and vectorizers in English and German. We are planning to provide a pip package as soon as possible in order to ease the application of this toolchain. 

## Environment Setup

We use [Anaconda](https://docs.anaconda.com/anaconda/install/linux/) on Ubuntu 20.04 in order to create the Python environment. Please ensure that you have Java installed. To setup the environment, please follow the instructions as provided below:

```
conda create -n pptc python=3.6.11 pip
conda activate pptc
conda env update -f environment.yml

```

Having setup the Python environment, we also need to download a [trained model](https://fasttext.cc/docs/en/language-identification.html) of FastText for the language detection module. For this purpose:

```
wget https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.bin -P ./resources

```


## Explanation
The toolchain consists of five steps:
1. Finding potential privacy/cookie policies on websites
2. Text-from-HTML extraction
3. Language detection
4. Key phrase extraction
5. Classification


The tool expects a path like `data` followed by a folder named with, e.g., the date of the crawl, which contains the rawl HTML/XML files of the respecting crawl. The tool reads these files and saves the data and according metadata in a [TinyDB](https://tinydb.readthedocs.io/en/latest/) database, which offers benefits such as potability and simplicity. If a different data storage format is required, the code can be adapted easily due to its modular design. If you have any questions about how to work with the code or regarding replication of our results, feel free to contact us.

## Structure of the repository
The current structure of the repository is depicted as follows:

```
.
|-- README.md
`-- privacy_policy_toolchain
    |-- feature_list
    |   |-- feature_list_de.txt
    |   `-- feature_list_en.txt
    |-- ppt.py
    `-- resources
        |-- VotingClassifier_soft_de.pkl
        |-- VotingClassifier_soft_en.pkl
        |-- trained_vectorizer_de.pkl
        `-- trained_vectorizer_en.pkl
```

The folder `resources` contains the trained models and the vectorizers for both English and German.

## Paper
Henry Hosseini, Martin Degeling, Christine Utz, Thomas Hupperich. "Unifying Privacy Policy Detection." PETS 2021.

## Contact
* Henry Hosseini: henry.hosseini@wi.uni-muenster.de