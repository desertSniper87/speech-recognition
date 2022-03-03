#!/usr/bin/env bash

# cd /code/fairseq

LANG="de-de"

fairseq-train ${MTEDX_ROOT}/$LANG \
    --config-yaml config_asr.yaml \
    --train-subset train_asr --valid-subset valid_asr \
    --save-dir ${ASR_SAVE_DIR} --num-workers 0 --max-tokens 40000 --max-epoch 15 \
    --task speech_to_text --criterion label_smoothed_cross_entropy --report-accuracy \
    --arch s2t_transformer_xs --optimizer adam --lr 2e-3 --lr-scheduler inverse_sqrt \
    --warmup-updates 10000 --clip-norm 10.0 --seed 1 --dropout 0.3 --label-smoothing 0.1 \
    --skip-invalid-size-inputs-valid-test \
    --keep-last-epochs 10 --update-freq 8 --patience 10
    # --load-pretrained-encoder-from ${PRETRAINED_ENCODER} \

