{-# LANGUAGE RankNTypes #-}
-- | This module is intended to be imported @qualified@, for example:
--
-- > import qualified Test.SmallCheck.Lens.Iso as Iso
--
module Test.SmallCheck.Lens.Iso where

import Control.Lens
import Test.SmallCheck (Property)
import qualified Test.SmallCheck as SC (over)
import Test.SmallCheck.Series (Series, Serial)

hither
  :: (Eq s, Show s, Eq a, Show a, Serial m a)
  => Iso' s a -> Series m s -> Property m
hither l ss = SC.over ss $ \s ->
    s ^. l . from l == s

yon
  :: (Eq s, Show s, Eq a, Show a, Serial m a)
  => Iso' s a -> Series m a -> Property m
yon l as = SC.over as $ \a -> a ^. from l . l == a
