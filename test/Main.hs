module Main where

import Control.Concurrent
import Control.Concurrent.Throttle
import Control.Monad

main :: IO ()
main = do res <- throttle 5 tasks
          putStrLn "-------------"
          forM_ res print
  where
    tasks = map performTask ([1..100] :: [Int])
    performTask i = do putStrLn $ "task start " ++ show i
                       threadDelay $ i * 10000
                       putStrLn $ "task done " ++ show i
                       return i

