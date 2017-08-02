# Git & Storyboard Reference

## Git


### Branch & Merge

#### Branch & Merge Work Flow Example

- Situation 1
    - 작업 중인 웹사이트가 있다.
    - 새로운 이슈를 처리할 새 Branch를 하나 생성.
    - 새로 만든 Branch에서 작업 중.

- Situation 2
    - 이때 중요한 문제가 생겨서 그것을 해결하는 Hotfix를 먼저 만들어야 한다. 그러면 다음과 같이 할 수 있다:
    - 새로운 이슈를 처리하기 이전의 운영(Production) 브랜치로 이동.
    - Hotfix 브랜치를 새로 하나 생성.
    - 수정한 Hotfix 테스트를 마치고 운영 브랜치로 Merge.
    - 다시 작업하던 브랜치로 옮겨가서 하던 일 진행.

#### Branch

- Situation 1

    - 53번 이슈에 집중할 수 있는 브랜치를 새로 하나 만든다.
    - 브랜치를 만들면서 Checkout까지 한 번에 하려면 git checkout 명령에 -b라는 옵션을 준다.

            $ git checkout -b iss53
            Switched to a new branch 'iss53'

    - 위 명령은 아래 명령을 줄여놓은 것이다:

            $ git branch iss53
            $ git checkout iss53
    
    - 결과
    ![](https://git-scm.com/figures/18333fig0310-tn.png) >>>>> ![](https://git-scm.com/figures/18333fig0311-tn.png)

    - iss53 브랜치를 Checkout했기 때문에 커밋하면 iss53 브랜치가 앞으로 진행한다

- Situation 2

    - 만드는 사이트에 문제가 생겨서 즉시 고쳐야 한다. 
    - 버그를 해결한 Hotfix에 'iss53'이 섞이는 것을 방지하기 위해 'iss53'와 관련된 코드를 어딘가에 저장해두고 원래 운영 환경의 소스로 복구해야 한다.

    - Git을 사용하면 이런 노력을 들일 필요 없이 그냥 master 브랜치로 옮기면 된다.

    - 그렇지만, 브랜치를 이동하려면 해야 할 일이 있다. 

        - 아직 커밋하지 않은 파일이 Checkout할 브랜치와 충돌 나면 브랜치를 변경할 수 없다.

        - 브랜치를 변경할 때에는 워킹 디렉토리를 정리하는 것이 좋다. 

        - 이런 문제를 다루는 방법은(주로, Stash이나 커밋 Amend에 대해) 나중에 다룰 것이다. 
        - 지금은 작업하던 것을 모두 커밋하고 master 브랜치로 옮긴다
 
                $ git checkout master
                Switched to branch 'master'


    - 이때 워킹 디렉토리는 53번 이슈를 시작하기 이전 모습으로 되돌려지기 때문에 새로운 문제에 집중할 수 있는 환경이 만들어진다.
    - Git은 자동으로 워킹 디렉토리에 파일들을 추가하고, 지우고, 수정해서 Checkout한 브랜치의 스냅샷으로 되돌려 놓는다는 것을 기억해야 한다.

    - hotfix라는 브랜치를 생성
        - 새로운 이슈를 해결할 때까지 사용한다:

                $ git checkout -b hotfix
                Switched to a new branch 'hotfix'
                $ vim index.html
                $ git commit -a -m 'fixed the broken email address'
                [hotfix 3a0874c] fixed the broken email address
                 1 files changed, 1 deletion(-)

                $ vim index.html
                $ git commit -a -m 'added a new footer [issue 53]'

        - 결과
    ![](https://git-scm.com/figures/18333fig0313-tn.png)

    - 운영 환경에 적용하려면 문제를 제대로 고쳤는지 테스트하고 master 브랜치에 합쳐야 한다. git merge 명령으로 다음과 같이 한다:

            $ git checkout master
            $ git merge hotfix
            Updating f42c576..3a0874c
            Fast-forward
             README | 1 -
             1 file changed, 1 deletion(-)

    - 결과
    ![](https://git-scm.com/figures/18333fig0314-tn.png)
    - Merge 메시지에서 'Fast-forward'가 보이는가? Merge할 브랜치가 가리키고 있던 커밋이 현 브랜치가 가리키는 것보다 '앞으로 진행한' 커밋이기 때문에 master 브랜치 포인터는 최신 커밋으로 이동한다.
    - 이런 Merge 방식을 'Fast forward'라고 부른다. 다시 말해서 A 브랜치에서 다른 B 브랜치를 Merge할 때 B가 A 이후의 커밋을 가리키고 있으면 그저 A가 B의 커밋을 가리키게 할 뿐이다.
    

    - 문제를 급히 해결하고 master 브랜치에 적용하고 나면 다시 일하던 브랜치로 돌아가야 한다. 하지만, 그전에 필요없는 hotfix 브랜치를 삭제한다. git branch 명령에 -d 옵션을 주고 브랜치를 삭제한다.

            $ git branch -d hotfix
            Deleted branch hotfix (was 3a0874c).

    - 이제 이슈 53번을 처리하던 환경으로 되돌아가서 하던 일을 계속 하자

            $ git checkout iss53
            Switched to branch 'iss53'
            $ vim index.html
            $ git commit -a -m 'finished the new footer [issue 53]'
            [iss53 ad82d7a] finished the new footer [issue 53]
             1 file changed, 1 insertion(+)
     
     - 결과
     ![](https://git-scm.com/figures/18333fig0315-tn.png)
 
 
    - 위에서 작업한 hotfix가 iss53 브랜치에 영향을 끼치지 않는다는 점을 이해하는 것이 중요하다. 
        - git merge master 명령으로 master 브랜치를 iss53 브랜치에 Merge하면 iss53 브랜치에 hotfix가 적용된다. 
        - 아니면 iss53 브랜치가 master에 Merge할 수 있는 수준이 될 때까지 기다렸다가 Merge하면 hotfix와 iss53가 합쳐진다.
 
 #### Merge
 
- 53번 이슈를 다 구현하고 master 브랜치에 Merge하는 과정을 살펴보자. master 브랜치에 Merge하는 것은 앞서 살펴본 hotfix 브랜치를 Merge하는 것과 비슷하다. git merge 명령으로 합칠 브랜치에서 합쳐질 브랜치를 Merge하면 된다:

        $ git checkout master
        $ git merge iss53
        Auto-merging README
        Merge made by the 'recursive' strategy.
         README | 1 +
         1 file changed, 1 insertion(+)

- 결과
    ![](https://git-scm.com/figures/18333fig0316-tn.png)

- hotfix를 Merge했을 때와 메시지가 다르다. 
- 현 브랜치가 가리키는 커밋이 Merge할 브랜치의 조상이 아니므로 Git은 'Fast-forward'로 Merge하지 않는다.
    - 이러면 Git은 각 브랜치가 가리키는 커밋 두 개와 공통 조상 하나를 사용하여 3-way Merge를 한다. 그림 3-16에 이 Merge에서 사용하는 커밋 세 개가 표시된다.

- 단순히 브랜치 포인터를 최신 커밋으로 옮기는 게 아니라 3-way Merge의 결과를 별도의 커밋으로 만들고 나서 해당 브랜치가 그 커밋을 가리키도록 이동시킨다.
    - 그래서 이런 커밋은 부모가 여러 개고 Merge 커밋이라고 부른다.

- Git은 Merge하는데 필요한 최적의 공통 조상을 자동으로 찾는다. 이런 기능도 Git이 다른 버전 관리 시스템보다 나은 점이다. CVS나 Subversion 같은 버전 관리 시스템은 개발자가 직접 공통 조상을 찾아서 Merge해야 한다. Git은 다른 시스템보다 Merge가 대단히 쉽다.
    
- ss53 브랜치를 master에 Merge하고 나면 더는 iss53 브랜치가 필요 없다. 다음 명령으로 브랜치를 삭제하고 이슈의 상태를 처리 완료로 표시한다:

        $ git branch -d iss53
    
    - 결과
    ![](https://git-scm.com/figures/18333fig0317-tn.png)

#### 충돌의 기초

- 3-way Merge 실패
    - Merge하는 두 브랜치에서 같은 파일의 한 부분을 동시에 수정하고 Merge하면 실패
        - 예를 들어, 53번 이슈와 hotfix가 같은 부분을 수정했다면 Git은 Merge하지 못하고 다음과 같은 충돌(Conflict) 메시지를 출력한다:

                $ git merge iss53
                Auto-merging index.html
                CONFLICT (content): Merge conflict in index.html
                Automatic merge failed; fix conflicts and then commit the result.

    - 실패시 새 커밋이 생기지 않는다. 
        - 변경사항의 충돌을 개발자가 해결하지 않는 한 Merge 과정을 진행할 수 없다. 
        - Merge 충돌이 일어났을 때 Git이 어떤 파일을 Merge할 수 없었는지 살펴보려면 git status 명령을 이용한다:

                $ git status
                On branch master
                You have unmerged paths.
                  (fix conflicts and run "git commit")

                Unmerged paths:
                  (use "git add <file>..." to mark resolution)

                both modified:      index.html

                no changes added to commit (use "git add" and/or "git commit -a")

        - 충돌이 일어난 파일은 unmerged 상태로 표시된다.
        - Git은 충돌이 난 부분을 표준 형식에 따라 표시해준다.
            - 그러면 개발자는 해당 부분을 수동으로 해결한다.
            - 충돌 난 부분은 다음과 같이 표시된다.

                    <<<<<<< HEAD
                    <div id='footer'>contact : email.support@github.com</div>
                    =======
                    <div id='footer'>
                        please contact us at support@github.com
                    </div>
                    >>>>>>> iss53

            - "=======" 위쪽의 내용은 HEAD 버전(merge 명령을 실행할 때 작업하던 master 브랜치)의 내용
            - 아래쪽은 iss53 브랜치의 내용이다.
            - 충돌을 해결하려면 위쪽이나 아래쪽 내용 중에서 고르거나 새로 작성하여 Merge한다.
                - 다음은 아예 새로 작성하여 충돌을 해결하는 예제다:

                        <div id='footer'>
                        please contact us at email.support@github.com
                        </div>
            
                - 충돌한 양쪽에서 조금씩 가져와서 새로 수정했다. 
                - 그리고 <<<<<<<, =======, >>>>>>> 가 포함된 행을 삭제하였다.
                - 이렇게 충돌한 부분을 해결하고 git add 명령으로 다시 Git에 저장한다.
                - 충돌을 쉽게 해결하기 위해 다른 Merge 도구도 이용할 수 있다. 
                    - git mergetool 명령으로 실행한다:

                            $ git mergetool

                            This message is displayed because 'merge.tool' is not configured.
                            See 'git mergetool --tool-help' or 'git help config' for more details.
                            'git mergetool' will now attempt to use one of the following tools:
                            opendiff kdiff3 tkdiff xxdiff meld tortoisemerge gvimdiff diffuse diffmerge ecmerge p4merge araxis bc3 codecompare vimdiff emerge
                            Merging:
                            index.html

                            Normal merge conflict for 'index.html':
                              {local}: modified file
                              {remote}: modified file
                            Hit return to start merge resolution tool (opendiff):
                            
                - Mac에서는 opendiff가 실행된다.
                - 기본 도구 말고 사용할 수 있는 다른 Merge 도구도 있는데, "... one of the following tools:" 부분에 보여준다. 
                    - 여기에 표시된 도구 중 하나를 고를 수 있다.

                - Merge 도구를 종료하면 Git은 잘 Merge했는지 물어본다. 잘 마쳤다고 입력하면 자동으로 git add가 수행되고 해당 파일이 Staging Area에 저장된다.

                - git status 명령으로 충돌이 해결된 상태인지 다시 한번 확인해볼 수 있다.

                        $ git status
                        On branch master
                        Changes to be committed:
                            (use 'git reset HEAD <file>...' to unstage)
                        modified:   index.html

                - 충돌을 해결하고 나서 해당 파일이 Staging Area에 저장됐는지 확인했으면 git commit 명령으로 Merge 한 것을 커밋한다. 충돌을 해결하고 Merge할 때에는 커밋 메시지가 아래와 같다.

                        Merge branch 'iss53'

                        Conflicts:
                          index.html
                        #
                        # It looks like you may be committing a merge.
                        # If this is not correct, please remove the file
                        #       .git/MERGE_HEAD
                        # and try again.
                        #
                        # It looks like you may be committing a merge.
                        # If this is not correct, please remove the file
                        #       .git/MERGE_HEAD
                        # and try again.
                        #
                - 충동 해결에 대한 코멘트와 작업내용을 기록
                    - 자세한 기록은 나중에 이 Merge 커밋을 이해하는데 도움을 줄 것이다.

---

### rebase로 merge
기본적으로 merge를 하게되면 두 개의 가지가 따로 뻗어 나가다 하나로 합쳐지는 모습을 볼 수 있다.
허나 rebase를 사용해 merge 하게된다면 두 개의 가지를 완전히 하나의 가지로 합칠 수 있다.
다음 밑에 내용을 따라해보자.

1. 우선 현재 디렉터리 안에 git을 사용할 수 있는 환경을 만들고 a.txt 파일을 만들자. 그리고 git에 추가한 뒤 커밋하자.

```
git init
touch a.txt
git add a.txt
git commit -m "create a.txt on master"
```

2. tmp branch를 만들고 tmp branch로 이동한 뒤

```
git branch tmp
git checkout tmp
```

3. a.txt 내용을 수정하자. 내용은 "branch branch"

```
vi a.txt
```

4. tmp branch에서 변경된 내용을 추가하고 커밋하자.

```
git add a.txt
git commit -m "editing a.txt on tmp branch"
```

5. 다시 master로 돌아온 뒤 a.txt 내용을 "master master"로 수정하고 추가 커밋한다.

```
git checkout master
vi a.txt
git add a.txt
git commit -m "editing a.txt on master"
```

6. 현재 상태를 확인해보자.

master의 a.txt는 "master master"란 내용을 가지고 있고 commit 내용은 "editing a.txt on master"이다.
tmp branch의 a.txt는 "branch branch"란 내용을 가지고 있고 commit 내용은 "editing a.txt on tmp branch"이다.
따라서 두 개의 가지를 병합하려 하면 당연히 충돌이 일어날 것이다.
이 상황에서 merge를 사용해 충돌을 해결할 수 있지만 이번 파트에선 rebase를 사용할 것이다.

7. tmp branch로 이동한 뒤에 master에 대해 rebase를 실행한다.

```
git checkout tmp
git rebase master
```

8. 다음과 같은 내용을 확인할 수 있다.

```
First, rewinding head to replay your work on top of it...
Applying: edit a.txt on tmp branch
Using index info to reconstruct a base tree...
M	a.txt
Falling back to patching base and 3-way merge...
Auto-merging a.txt
CONFLICT (content): Merge conflict in a.txt
error: Failed to merge in the changes.
Patch failed at 0001 edit a.txt on tmp branch
The copy of the patch that failed is found in: .git/rebase-apply/patch

When you have resolved this problem, run "git rebase --continue".
If you prefer to skip this patch, run "git rebase --skip" instead.
To check out the original branch and stop rebasing, run "git rebase --abort".
```

9. a.txt 내용이 master와 tmp branch 두 개로 나누어져 있는데 이를 알맞게 고쳐주자. 예를 들면 "master branch"만 남기자.

```
vi a.txt
```

10. 이제 a.txt 를 추가하고 commit이 아닌 rebase --continue 명령어를 통해 rebase를 완료하자.

```
git add a.txt
git rebase --continue
```

11. a.txt 내용을 확인해보고 다시 master로 이동하자.

```
git checkout master
```

12. master에서 a.txt 내용을 확인해보면 tmp branch와는 다르게 "master master"만 있는 것을 확인할 수 있다. 이제 merge해보자.

```
git merge tmp
```
다시 a.txt를 확인해보면 "master branch"로 내용이 수정된 것을 확인할 수 있다.

13. 끝으로 현재 git log를 그래프로 확인해보자.

```
git log --graph --all
```
그래프를 확인해보면 두 개의 branch가 합쳐진게 아닌 하나의 branch로만 이루어진 것을 확인할 수 있다.

그럼 이제 그냥 merge를 한 것과 rebase를 통한 merge의 차이점에 대해서 궁금해진다.
왜 굳이 두 개의 branch를 완전한 하나로 합치는 것일까?
우선 git은 협업을 위해 사용하는 일종의 커뮤니케이션 공간이다. 작업을 혼자만 하는 것이 아니므로 다같이 현재 상황에 대해서 알 수 있어야 한다.
이 때 많은 branch들이 있는 상황에서 단순히 merge만 한다면 여러 가지들이 복잡하게 연결된다. `rebase`를 사용한다면 복잡한 과정을 거쳤어도 한 눈에 쉽게 볼 수 있다.
불필요한 커밋 내용을 지우고 merge하는 부분은 rebase의 --onto 명령어를 활용하자.

14. merge vs rebase

merge
![](http://dogfeet.github.io/articles/2012/git-merge-rebase/merge3.png)

rebase
![](http://dogfeet.github.io/articles/2012/git-merge-rebase/rebase3-merge.png)

---

### 그외 기능들
#### Sharing and Updating Projects
- fetch
이 명령은 로컬에는 없지만, 리모트 저장소에는 있는 데이터를 모두 가져온다. 그러면 리모트 저장소의 모든 브랜치를 로컬에서 접근할 수 있어서 언제든지 Merge를 하거나 내용을 살펴볼 수 있다.

    저장소를 Clone 하면 명령은 자동으로 리모트 저장소를 ‘origin’이라는 이름으로 추가한다. 그래서 나중에 git fetch origin 명령을 실행하면 Clone 한 이후에(혹은 마지막으로 가져온 이후에) 수정된 것을 모두 가져온다. git fetch 명령은 리모트 저장소의 데이터를 모두 로컬로 가져오지만, 자동으로 Merge 하지 않는다. 그래서 당신이 로컬에서 하던 작업을 정리하고 나서 수동으로 Merge 해야 한다.

- pull
git remote 명령어를 통해 서로 연결된 원격 저장소의 최신 내용을 로컬 저장소로 가져오면서 병합함. git push와 반대 성격의 명령어

- push
로컬 저장소의 내용을 보내거나 로컬 저장소의 변경 사항을 원격 저장소로 보냄.

- remote
git remote 명령은 원격 저장소 설정인 리모트의 관리 도구다. 긴 URL 대신 “origin”처럼 이름을 짧게 지을 수 있다. 그리고 URL대신 짧은 리모트 이름을 사용한다. git remote 명령으로 이 리모트를 여러 개 만들어 관리할 수 있다.

- submodule
git submodule 명령은 저장소 안에서 다른 저장소를 관리하는 데 사용한다. 라이브러리나 특정 형식의 리소스 파일을 서브모듈로 사용할 수 있다. submodule 명령에 있는 add, update, sync 등의 하위 명령어로 서브모듈을 관리할 수 있다.
    - 서브모듈 시작하기

        다음과 같이 작업할 Git 저장소에 `git submodule add URL` 명령어로 미리 준비된 리모트 Git 저장소를 서브모듈로 추가한다. 이렇게 추가하고 나면, 기본적으로 서브모듈은 프로젝트 저장소의 이름(DbConnecter)으로 디렉토리를 만든다. 명령의 마지막에 원하는 이름을 넣어 다른 디렉토리 이름으로 서브모듈을 추가할 수도 있다.
        ```
        $ git submodule add https://github.com/chaconinc/DbConnector
        ```
        `git status` 명령어로 `.gitmodules` 파일이 생성된 것을 알 수 있   다. 이 파일은 서브디렉토리와 하위 프로젝트 URL의 매핑 정보를 담은 설정파일이다. 
        ```
        $ git status
        On branch master
        Your branch is up-to-date with 'origin/master'.

        Changes to be committed:
        (use "git reset HEAD <file>..." to unstage)

        new file:   .gitmodules
        new file:   DbConnector
        ```
        다음 명령어로 서브모듈에 대해 살펴볼 수 있다. `--submodule` 옵션을 더하면 서브모듈에 대해 더 자세히 나온다.   
        ```
        $ git diff --cached DbConnector
        $ git diff --cached --submodule
        ```
        다음 명령어로 하위 프로젝트를 포함한 커밋을 생성하고 Push 할 수 있다.
        ```
        $ git commit -am 'added DbConnector module'
        $ git push origin master
        ```

#### Inspection and Comparison
- show
git show 명령은 Git 개체를 사람이 읽을 수 있도록 요약해서 보여준다. 태그나 커밋 정보를 보고 싶을 때 이 명령을 사용한다.
origin 같은 단축이름으로 이 명령을 실행하면 아래와 같은 정보를 볼 수 있다
    ```
    $ git remote show origin
    * remote origin
      Fetch URL: https://github.com/schacon/ticgit
      Push  URL: https://github.com/schacon/ticgit
      HEAD branch: master
      Remote branches:
        master                               tracked
        dev-branch                           tracked
      Local branch configured for 'git pull':
        master merges with remote master
      Local ref configured for 'git push':
        master pushes to master (up to date)
    ```
    리모트 저장소의 URL과 추적하는 브랜치를 출력한다. 이 명령은 git pull 명령을 실행할 때 master 브랜치와 Merge 할 브랜치가 무엇인지 보여 준다. git pull 명령은 리모트 저장소 브랜치의 데이터를 모두 가져오고 나서 자동으로 Merge 할 것이다. 그리고 가져온 모든 리모트 저장소 정보도 출력한다.

- log
git log 명령은 프로젝트 히스토리를 시간의 역순으로 보여준다. 넘겨준 Ref를 따라 히스토리를 보여주는데 Ref를 한 개가 아니라 여러 개 넘길 수도 있다. Ref를 넘겨 주지 않으면 HEAD가 가리키는 브랜치의 히스토리를 보여준다. 또 이 명령으로 여러 브랜치들 사이의 차이를 커밋 단위로 볼 수 있다.

- diff
git diff 명령은 두 트리 개체의 차이를 보고 싶을 때 사용한다. 워킹 디렉토리와 Staging Area를 비교할 수 있고(git diff) Staing Area와 마지막 커밋을 비교할 수 있다(git diff --staged). 그리고 두 커밋을 비교할 수 있다(git diff master branchB).

- shortlog
git shortlog 명령은 git log 명령의 결과를 요약해서 보여 준다고 생각하면 된다. 옵션도 git log 명령의 것과 매우 비슷하다. 이 명령은 Author 별로 커밋을 묶어서 보여준다.

- describe
git describe 명령은 커밋과 관련된 정보를 잘 조합해서 사람이 읽을 수 있는 문자로 결과를 만든다. 커밋 SHA-1처럼 식별 가능하고 사람이 이해할 수 있는 정보가 필요할 때 사용한다.

#### Debugging
- bisect
git bisect는 굉장히 유용하다. 이진 탐색 알고리즘을 사용해서 버그나 문제가 생긴 커밋을 쉽게 찾을 수 있다.

- blame
git blame은 파일의 각 라인을 누가 마지막으로 수정했는지 보여준다. 그래서 특정 코드에 대해 궁금한 게 있을 때 누구에게 물어야 할지 바로 알 수 있다.

- grep
소스 코드에서 스트링이나 정규표현식을 찾을 수 있다. git grep 명령을 사용하면 예전 소스 코드까지 찾는다.

## Git-flow
> Vincent Driessen’s의 branching model을 적용하여 고수준으로 저장소를 관리하기 위한 Git 확장 콜렉션

Vincent의 branching model은 “feature – develop – release – hotfixes – master” 단계로 branch를 나눠서 코드를 관리하는 전략이다. git의 branch 관리가 아무리 빠르고 편하다 한들, 이렇게 프로세스를 나눠서 작업을 하려면 귀찮기 마련이다. 그래서 사용자가 쉽게 접근할 수 있도록 확장 명령어 셋을 제공하는 것이 바로 git flow다.

### Installation
#### Mac OS (Homebrew)
```
brew install git-flow-avh
```

### Commands
![](https://danielkummer.github.io/git-flow-cheatsheet/img/git-flow-commands.png)

이 전략은 `master`와 `develop`을 각각 배포 및 개발 브랜치로 사용하면서, `feature`, `release`, `hotfix` 등을 위한 임시 브랜치를 사용한다.

### Branching Model
#### 주요 Branch
- master: 이미 충분히 검증되어 배포된 상용 소스를 버전별로 관리하는 브랜치.
- develop: 실제 개발이 이루어지는 브랜치. 모든 기능이 develop 브랜치에서 개발될 수 있고 아직 개발 중이기 때문에 안정성이 떨어질 수 있다.

develop 브랜치에서 신나게 개발을 하고 안정화가 되면 master에 머지하고 버전을 찍는 구조라고 보면 된다. 이 두 개의 브랜치만 있으면 우선은 간단한 형상관리는 할 수 있다. 하지만, Vincent Driessen은 develop 브랜치에서 직접 master 브랜치로 머지하지 않고 다른 3가지 브랜치를 함께 제안하고 있는데, 거기에는 다 그만한 이유가 있다. 비본질적 브랜치이긴 하지만, 프로젝트를 성공적으로 이끌기 위해서는 사실 다음 브랜치들의 역할이 정말 중요하다.

#### 보조 Branch
- feature: 새로운 기능을 개발하기 위한 브랜치이다. 이 브랜치는 develop 에서 분기되어 개발 완료 후 develop으로 머지되며, 개발중인 기능의 개수만큼 존재할 수 있다. 예) feature/myfeature
- release: 기능개발 완료 후 안정화를 위한 브랜치. 다음 버전에 포함될 기능이 모두 머지된 시점의 develop 브랜치에서 분기하여 안정화 작업이 끝나면 develop과 master브랜치에 각각 머지된다.
- hotfix: 이미 릴리즈 된 소스에서 버그가 발견되어 긴급히 수정하여 배포해야할 때 사용하는 브랜치이다.


### Git Flow Model 예시
![](http://cfile23.uf.tistory.com/image/24380C43589AB896165E8A)

### Summary
1. 모든 개발은 develop 브랜치를 기반으로 진행하되, 새로운 기능을 개발하는 경우는 develop 브랜치에서 feature/* 브랜치를 새로 따서 작업 후 develop 에 머지한다.
2. 배포를 위해 안정화를 해야 하는 경우에는 배포하고자 하는 기능들이 모두 머지된 develop 브랜치에서 release 브랜치를 따고 더 이상의 수정은 bug fix로 제한한다.
3. 안정화가 완료되면, release 브랜치를 master 브랜치에 머지 후 versioning 하여 배포하고, release 브랜치에서 수정된 버그들은 develop 브랜치에 머지한다.
4. 배포된 버전에서 문제가 생긴 경우에는 해당 버전의 master 브랜치에서 hotfix/* 브랜치를 따서 해당 문제를 수정한 후 master 브랜치에 머지하여 배포하고, develop 브랜치에도 확산전개 한다.

[출처] Git, 가장 쉽게 사용하기 - (2) commit, branch 전략 잘 짜는 법

Git flow는 git의 branch를 효율적으로 활용할 수 있는 다양한 branching 전략 중에 하나이다. 하지만 많은 사람들이 사용한다고 해서 무조건 나에게 적합한 것은 아니다. 필요에 따라 적절히 커스터마이징 하는 것도 요구되며 나의 프로젝트에 적합한 모델을 만들어가려는 노력이 필요하다. Git-flow 외에도 GitHub flow, Gitlab flow 등 Git flow 외에도 파생된 다양한 branching model이 존재하므로 참고하면 좋다.

---

## Storyboard Reference

Apple은 스토리보드 관리를 더 쉽게 하려는 목표와 함께 iOS9 과 macOS 10.11 에서 story reference를 소개했다. Xcode 7 부터 view contreoller 또는 다른 스토리 보드의 intial view controller 를 가리킬 수있는 storyboard reference 를 사용하여 Interface Builder에서 바로 스토리 보드간에 참조를 추가 할 수 있다. 이렇게하면 스토리 보드를 더 작은 스토리 보드로 쉽게 분할 할 수 있다.

### 이점

* 크고 복잡한 스토리보드를 작은 스토리보드들고 쪼갤수 있다
* 스토리보드의 특정한 scene으로 이동할 수 있다.
* 스토리보드들과 scenes을 재사용할 수 있다.
* 협업시 merge conflict를 줄일 수 있다.

### 단점

* iOS9 과 macOS 10.11에서 도입되었기 때문에 기존의 프로젝트에서는 사용할 수 없다

### 실습

Main.storyboard를 storyboard reference를 이용해 다수의 storyboard로 나누는 작업을 할 것이다.
![](https://cocoacasts.s3.amazonaws.com/organizing-storyboards-with-storyboard-references/figure-main-storyboard-1.jpg)

기존의 storyboard를 더 작은 storyboard로 쪼개려면 먼저 새로운 storyboard로 들어갈 scene을 선택해서 storyboard referce로 변경 시켜야 한다.

Main.storyboard 의 Note View Controller scene을 선택하고 Xcode 상단의 Editor menu에서 Refactor to Storyboard를 선택해서 Note View Contoller scene을 이동시킬 stoayboard를 만든다.

그러면 Main.storyboard의 Note View Controller Scene은StoryBoard reference로 대체 된다.

![](https://cocoacasts.s3.amazonaws.com/organizing-storyboards-with-storyboard-references/figure-note-view-controller-storyboard-1.jpg)


NoteVireContoller.storyboard의 initial view Controller가 Note View Controller로 되어 있을 것이다.


![](https://cocoacasts.s3.amazonaws.com/organizing-storyboards-with-storyboard-references/figure-storyboard-reference-1.jpg)

storyboard reference 는 3개의 attribute를 가지고 있다

* Storyboard 항목은 해당 referece가 참조하는 storyboard를 나타낸다.
* Refereced ID 는 참조된 storyboard의 identifier를 나타내는데 현재는 비어있는데, initial view controller가 현재 참조 대상임을 의미한다.
* Bundle은 참조된 storyboard가 속해 있는 bundle을 의미하고, 이 속성을 비워두면, storyboard reference가 속해 있는 bundle을 가르킨다.

이 세가지 속성은 storyboard reference의 유연성과 장점을 극대화 시킨다. 예를 들어서 storyboard를 확장시켜서 다른 라이브러리나 프레임워크의 storyboard에 연결할 수 있다.

## Reference
https://git-scm.com/book/ko/v1/Git-브랜치-브랜치와-Merge의-기초
https://backlogtool.com/git-guide/kr/stepup/stepup2_8.html
https://git-scm.com/docs/git-fetch
http://huns.me/development/1131
https://www.slideshare.net/charsyam2/git-flow-38708820
http://tmondev.blog.me/220763012361
https://cocoacasts.com/organizing-storyboards-with-storyboard-references/
