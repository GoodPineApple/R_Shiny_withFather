# p.22
# 배포를 위한 패키지 설치
install.packages("rsconnect")

# shiny패키지 다운로드
install.packages("shiny")
library(shiny)

# 실행 후 publish 버튼을 클릭하여 웹에 배포한다.
runExample("03_reactivity")