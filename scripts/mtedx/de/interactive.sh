#!/usr/bin/env bash

cd /code

LANG="de-de"
CHECKPOINT_FILENAME=avg_last_5_checkpoint.pt
INPUT_FILE=/data/MTEDX_ROOT/de-de/data/test/wav/UhOlDWx4h3M.flac

{
    echo $INPUT_FILE
} | fairseq-interactive ${MTEDX_ROOT}/$LANG \
        --config-yaml config_asr.yaml \
        --task speech_to_text \
        --path ${ASR_SAVE_DIR}/${CHECKPOINT_FILENAME} \
        --max-tokens 50000 --beam 5 \
        # > /tmp/output.txt

cat /tmp/output.txt