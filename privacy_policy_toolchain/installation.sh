#!/bin/bash
sudo apt update || exit 1
sudo apt install openjdk-8-jre build-essential || exit 1
git clone https://github.com/ITSec-WWU-Munster/Unifying-Privacy-Policy-Detection.git || exit 1
cd Unifying-Privacy-Policy-Detection || exit 1
conda run -n pptc || exit 1
conda activate pptc || exit 1
pip install git+https://github.com/boudinfl/pke.git || exit 1
python -m spacy download en_core_web_lg || exit 1
python -m spacy download de_core_news_lg || exit 1
python -m spacy download xx_ent_wiki_sm || exit 1
python -c "import nltk; nltk.download('all')" || exit 1
polyglot download LANG:de || exit 1
polyglot download LANG:en || exit 1
echo "Done!"