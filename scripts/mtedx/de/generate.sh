#!/usr/bin/env bash

cd /code

LANG="de-de"

CHECKPOINT_FILENAME=avg_last_5_checkpoint.pt
python3 scripts/average_checkpoints.py \
  --inputs ${ASR_SAVE_DIR} --num-epoch-checkpoints 5 \
  --output "${ASR_SAVE_DIR}/${CHECKPOINT_FILENAME}"

fairseq-generate ${MTEDX_ROOT}/$LANG \
  --config-yaml config_asr.yaml --gen-subset test_asr --task speech_to_text \
  --path ${ASR_SAVE_DIR}/${CHECKPOINT_FILENAME} --max-tokens 50000 --beam 5 \
  --skip-invalid-size-inputs-valid-test \
  --scoring wer --wer-tokenizer 13a --wer-lowercase --wer-remove-punct --remove-bpe
