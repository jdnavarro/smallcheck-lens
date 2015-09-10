{-# LANGUAGE RankNTypes #-}
-- | This module is intended to be imported @qualified@, for example:
--
-- > import qualified Test.SmallCheck.Lens.Lens as Lens
--
module Test.SmallCheck.Lens.Lens where

import Control.Lens
import Test.SmallCheck (Property)
import qualified Test.SmallCheck as SC (over)
import Test.SmallCheck.Series (Series)

setView :: (Monad m, Eq s, Show s) => Lens' s a -> Series m s -> Property m
setView l ss = SC.over ss $ \s -> set l (view l s) s == s

viewSet
  :: (Monad m, Eq s, Eq a, Show s, Show a)
  => Lens' s a -> Series m s -> Series m a -> Property m
viewSet l ss as = SC.over ss $ \s -> SC.over as $ \a ->
    view l (set l a s) == a
