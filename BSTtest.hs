module BSTtest where

import Test.Hspec

import BSTmain
main :: IO ()
main = hspec $ do

describe "LCA Binary Search Tree Tests" $ do
  it "returns the lowest common ancestor of nodes 4 and 9; should be 8" $
    shouldBe (mylca 4 9)  8

  it "returns the lowest common ancestor of nodes 9 and 4; should be 8" $
    mylca 9 4 `shouldBe` 8

  it "returns the lowest common ancestor of nodes 4 and 4; should be 4" $
    mylca 4 4 `shouldBe` 4

  it "returns the lowest common ancestor of nodes 10 and 2; should be 8" $
    mylca 10 2 `shouldBe` 8

  it "returns the lowest common ancestor of nodes 7 and 12; should be 8" $
    mylca 7 12 `shouldBe` 8

  it "returns the lowest common ancestor of nodes 9 and 11; should be 9" $
    mylca 9 11 `shouldBe` 9

  it "returns the lowest common ancestor of nodes 11 and 9; should be 9" $
    mylca 11 9 `shouldBe` 9

  it "returns the lowest common ancestor of nodes 2 and 4; should be 4" $
    mylca 2 4 `shouldBe` 4

  it "returns the lowest common ancestor of nodes 4 and 2; should be 4" $
    mylca 4 2 `shouldBe` 4

  it "ERROR test: two nodes not in tree" $
    mylca 6 13 `shouldBe` error "Node not in tree"

  it "ERROR test: first node not in tree" $
    mylca 3 7 `shouldBe` error "Node not in tree"

  it "ERROR test: second node not tree" $
    mylca 7 3 `shouldBe` error "Node not in tree"

  --Directed Acyclic Graph LCA tests
describe "LCA Directed Acyclic Graph Tests" $ do
  it "returns the lca of the same node 0 for given DAG; should be [0]" $
    daglca 0 0 `shouldBe` [0]

  it "returns the lca of the same node 1 for given DAG; should be [1]" $
    daglca 1 1 `shouldBe` [1]

  it "returns the lca of nodes 4 and 3 for given DAG; should be [3]" $
    daglca 4 3 `shouldBe` [3]

  it "returns the lca of nodes 3 and 4 for given DAG; should be [3]" $
    daglca 3 4 `shouldBe` [3]

  it "returns the lca of nodes 5 and 4 for given DAG; should be [1,2]" $
    daglca 5 4 `shouldBe` [1,2]

  it "returns the lca of nodes 4 and 5 for given DAG; should be [1,2]" $
    daglca 4 5 `shouldBe` [1,2]

  it "ERROR TEST: First node does not exist in given DAG; should be []" $
    daglca 10 1 `shouldBe` []

  it "ERROR TEST: Second node does not exist in given DAG; should be []" $
    daglca 4 7 `shouldBe` []

  it "ERROR TEST: Neither node exists in given DAG; should be []" $
    daglca 10 8 `shouldBe` []
