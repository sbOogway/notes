cp ../micro/docs/notes.pdf micro.pdf
cp ../prog_func/notes.pdf prog_func.pdf
cp ../prog_proc/notes.svg prog_proc.svg
cp ../automi/notes.pdf automi.pdf

git add .
git commit -m "build $(date)" 
git push