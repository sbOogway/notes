cp ../micro/docs/notes.pdf micro.pdf
cp ../prog_func/notes.pdf prog_func.pdf

git add .
git commit -m "build $(date)" 
git push