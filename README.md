**프로젝트명: 쥬스 메이커**

**프로젝트 설명:** 2개의 화면으로 구성된 간단한 재고 관리 어플리케이션

**진행기간: 2021/03/08 ~ 2021/03/19**

**프로젝트 진행 인원: 2인**

##### **작동 화면**

<img src="https://raw.githubusercontent.com/Neph3779/Blog-Image/forUpload/img/20220921170229.gif" alt="JuiceMaker3" style="zoom:50%;" />

## 주요 학습 내용

- Storyboard의 사용

  - Auto layout의 활용
  - Segue를 통한 화면전환

- UI 객체들의 활용

  - UIImageView, UIButton, UILabel, CALayer.cornerRadius 등

- UI 객체들을 상속받는 custom class의 사용

- UIAlertController의 활용

  -   ```swift
      func failAlert() -> UIAlertController {
              let alert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
              let yesAction = UIAlertAction(title: "예", style: .cancel) { action in
                  guard let stockView = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") else {
                      return
                  }
                  stockView.modalTransitionStyle = .flipHorizontal
                  stockView.modalPresentationStyle = .fullScreen
                  self.present(stockView, animated: true, completion: nil)
              }
              let noAction = UIAlertAction(title: "아니오", style: .default)
              
              alert.addAction(yesAction)
              alert.addAction(noAction)
              return alert
      }
      ```

- @IBDesignable의 활용

- Modal과 Present의 차이점 학습

- 타입 프로퍼티의 활용

- 접근제어자 활용

  - private과 internal의 차이
  - internal과 public의 차이
  - private(set)의 활용

- Class instance의 상수로써의 사용, 변수로써의 사용, 둘의 차이점

- DispatchQueue를 활용한 일정 시간 이후 dismiss되는 화면의 구현

  -   ```swift
      func successAlert(typeOfJuice: Juice) -> UIAlertController {
            let alert = UIAlertController(title: "주문 확인",
                                          message: "\(typeOfJuice.name) 나왔습니다! 맛있게 드세요!",
                                          preferredStyle: .alert)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                alert.dismiss(animated: true, completion: nil)
            }
            return alert
        }
      ```





 

## 주요 피드백과 개선내역

**Step1 PR 링크:** https://github.com/yagom-academy/ios-juice-maker/pull/37

**Step2 PR 링크:** https://github.com/yagom-academy/ios-juice-maker/pull/51

**Step3 PR 링크:** https://github.com/yagom-academy/ios-juice-maker/pull/53



> 피드백 1: 조건문의 조건에서 메소드를 실행시키는 부분은 좀 어색해보입니다.

C언어와 다르게 Swift에는 연산프로퍼티가 존재하므로 메서드의 호출이 아닌 연산프로퍼티를 활용하는 방향으로 해결했다.

<br/> 

> 피드백 2: 초기화함수를 작성할 때 와일드카드 패턴을 쓰면 이 객체를 처음 사용하는 사람은 어떻게 생성할지 막막할 것 같습니다.

이 피드백을 받고 내가 만든 객체를 다른 사람이 쓰게되는 경우에 대해서도 생각해보게 되었다. init의 파라미터명은 와일드카드 패턴을 통해 생략하기 보다는 전부 적는 것이 객체를 처음 사용할 사람에게 더 친절한 접근일 것이라 생각하였기에 수정이 이루어졌다. 
