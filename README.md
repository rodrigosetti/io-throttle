io-throttle
===========

[![Build Status](https://travis-ci.org/rodrigosetti/io-throttle.svg)](https://travis-ci.org/rodrigosetti/io-throttle)

Limit the number of tasks started per second. The throttle function will
run all actions concurrently but only starting a certain number per
second. It will wait for all tasks and return the results in a list.

Example:

```haskell
module Main where

import Control.Concurrent
import Control.Concurrent.Throttle
import Control.Monad

main :: IO ()
main = do results <- throttle 5 tasks
          putStrLn $ "------ RESULTS: ------"
          forM_ results print
  where
    tasks = map performTask ([1..100] :: [Int])
    performTask i = do putStrLn $ "started task: " ++ show i
                       threadDelay $ i * 10000
                       putStrLn $ "task finished: " ++ show i
                       return i
```

