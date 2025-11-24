TARGET_DIR="${1:-.}"

echo "Organizing files in: $TARGET_DIR"
echo "--------------------------------"

mkdir -p "$TARGET_DIR"/{images,videos,music,documents,archives,others}

for file in "$TARGET_DIR"/*; do
    if [[ -d "$file" ]]; then
        continue
    fi

    case "${file,,}" in
        *.jpg|*.jpeg|*.png|*.gif|*.bmp|*.webp)
            mv "$file" "$TARGET_DIR/images/"
            echo "Moved image: $(basename "$file")"
            ;;
        *.mp4|*.mkv|*.avi|*.mov)
            mv "$file" "$TARGET_DIR/videos/"
            echo "Moved video: $(basename "$file")"
            ;;
        *.mp3|*.wav|*.flac|*.ogg)
            mv "$file" "$TARGET_DIR/music/"
            echo "Moved music: $(basename "$file")"
            ;;
        *.pdf|*.doc|*.docx|*.txt|*.ppt|*.xls|*.xlsx)
            mv "$file" "$TARGET_DIR/documents/"
            echo "Moved document: $(basename "$file")"
            ;;
        *.zip|*.rar|*.tar|*.gz|*.7z)
            mv "$file" "$TARGET_DIR/archives/"
            echo "Moved archive: $(basename "$file")"
            ;;
        *)
            mv "$file" "$TARGET_DIR/others/"
            echo "Moved other file: $(basename "$file")"
            ;;
    esac
done
