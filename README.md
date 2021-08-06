# UI 
<table>
  <tr>
    <td>Landing Page</td>
     <td>Landing Page Tap to see more</td>
     <td>Search by city</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/31488481/127888655-31ade1c8-3e0b-40b1-be86-220633d5a2f9.png"></td>
    <td><img src="https://user-images.githubusercontent.com/31488481/127888680-848c0c26-1778-4284-9aca-4db29ac61e00.png"></td>
    <td><img src="https://user-images.githubusercontent.com/31488481/127888664-4d004b71-22ce-4d29-969e-88c066526e1a.png"></td>
  </tr>
    <tr>
    <td>Search Result 1</td>
     <td>Search Result 2</td>
      <td></td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/31488481/127888670-07b07a0d-c59b-4dbd-87fa-f3f0a1f60cf9.png"></td>
    <td><img src="https://user-images.githubusercontent.com/31488481/127888674-939e4ad8-1b74-4845-8e56-b685e7747edc.png"></td>
    <td></td>
  </tr> 
     <tr>
    <td>Search with wrong cityname</td>
     <td>Error Search Result</td>
       <td></td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/31488481/127888647-20530331-7535-40e2-9483-fe06e87e47cc.png"></td>
    <td><img src="https://user-images.githubusercontent.com/31488481/127888653-1cd9c3a8-f90c-40e3-b1d4-40515d209a70.png"></td>
    <td></td>
  </tr>
 </table>


















# Problems I've faced while completing this app


## 1. Hiding credentials

> Soln:
> git add . , then check the path of the tracked file you don't want to push. copy paste to .gitignore

## 2. Platform Exception

> Soln:
> Restart the device

## 3. StateNotifier multiple state problem

> Solved: 
> Use Different function that returs different state.
[Riverpod Video Tutorial](https://www.youtube.com/playlist?list=PL1WkZqhlAdC-GNyxQbfn8Db9pR6bRcQuw)

## 4. More

- AsyncValue with FutureProvider
- https://stackoverflow.com/questions/67582335/how-to-get-the-old-state-before-updating-the-state-in-state-notifier-riverpod
- my git queries - https://github.com/rrousselGit/river_pod/issues/212
- await on asyncValue - https://stackoverflow.com/questions/66411312/riverpod-how-to-await-using-futureprovider-on-asyncvalue-not-in-widget/66955043#66955043
- cached refresh indicator
  https://github.com/rrousselGit/river_pod/issues/461
- Unhandled Exception: setState() or markNeedsBuild() called during build  
  https://github.com/rrousselGit/river_pod/issues/177

## Know about riverpod (written tutorial)

https://codewithandrea.com/videos/flutter-state-management-riverpod/
