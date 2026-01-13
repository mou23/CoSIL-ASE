export PYTHONPATH=$PYTHONPATH:$(pwd)
export PROJECT_FILE_LOC=""
export HF_ENDPOINT=https://hf-mirror.com

# Fault Localization
models=("gpt4o-mini")
model_names=("gpt-4o-mini")
backend=("openai")
threads=2

for i in "${!models[@]}"; do
  python afl/fl/AFL_localize_file.py --file_level \
                               --output_folder "results/swe-bench-lite/file_level_${models[$i]}" \
                               --num_threads ${threads} \
                               --model "${model_names[$i]}" \
                               --backend "${backend[$i]}" \
                               --skip_existing
done




