@echo off
chcp 65001 >nul
setlocal
echo =========================================
echo       [보라돌이 블로그 새 글 생성기]
echo =========================================
echo.
echo 1. 파일 이름에 들어갈 짧은 영어 제목을 적어주세요.
echo    (※ 띄어쓰기 대신 하이픈[-]을 달아주세요. 예: new-post, daily-log)
set /p eng_title="- 입력: "

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set yyyy=%datetime:~0,4%
set mm=%datetime:~4,2%
set dd=%datetime:~6,2%
set today=%yyyy%-%mm%-%dd%

set filename=_posts\%today%-%eng_title%.md

if not exist "_posts" mkdir "_posts"

(
echo ---
echo layout: post
echo title: "[여기에 블로그 제목을 쓰세요]"
echo date: %today%
echo description: "이 글의 간단한 요약이나 부제목"
echo tags: [일기]
echo ---
echo.
echo 이곳부터 내용을 자유롭게 작성하세요!
) > "%filename%"

echo.
echo 완료! [%filename%] 파일이 생성되었습니다.
echo 자동으로 편집기를 엽니다...
timeout /t 2 >nul
start "" "%filename%"
