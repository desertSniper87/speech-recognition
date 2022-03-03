#!/usr/bin/env bash

cd /code

LANG="de-de"

# python3 examples/speech_to_text/prep_mtedx_data.py \
#   --data-root ${MTEDX_ROOT} --task asr \
#   --vocab-type unigram --vocab-size 1000

python3 examples/speech_to_text/prep_mtedx_data.py \
  --data-root ${MTEDX_ROOT} --task st \
  --vocab-type unigram --vocab-size 1000


