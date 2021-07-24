
1. Hiding credentials 
      Soln:
    git add . , then check the path of the tracked file you don't want to push. copy paste to      .gitignore

2. Platform Exception
      Soln:
     Restart the device

3. StateNotifier multiple state problem
     Unsolved 
      Soln: 
       1. AsyncValue with FutureProvider
       2. https://stackoverflow.com/questions/67582335/how-to-get-the-old-state-before-updating-the-state-in-state-notifier-riverpod
       3. my git queries - https://github.com/rrousselGit/river_pod/issues/212
       4. await on asyncValue - https://stackoverflow.com/questions/66411312/riverpod-how-to-await-using-futureprovider-on-asyncvalue-not-in-widget/66955043#66955043
       5. cached refresh indicator
https://github.com/rrousselGit/river_pod/issues/461
       6. Unhandled Exception: setState() or markNeedsBuild() called during build  
https://github.com/rrousselGit/river_pod/issues/177



Know about riverpod (written tutorial)
https://codewithandrea.com/videos/flutter-state-management-riverpod/