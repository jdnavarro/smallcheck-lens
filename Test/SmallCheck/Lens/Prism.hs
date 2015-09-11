{-# LANGUAGE RankNTypes #-}
-- | This module is intended to be imported @qualified@, for example:
--
-- > import qualified Test.SmallCheck.Lens.Prism as Prism
--
module Test.SmallCheck.Lens.Prism where

import Control.Lens
import Test.SmallCheck (Property)
import qualified Test.SmallCheck as SC (over)
import Test.SmallCheck.Series (Series)

yin :: (Monad m, Eq s, Show s, Eq a, Show a)
    => Prism' s a -> Series m a -> Property m
yin l as = SC.over as $ \a -> preview l (review l a) == Just a

yang
  :: (Monad m, Eq s, Show s, Eq a, Show a)
  => Prism' s a -> Series m s -> Property m
yang l ss = SC.over ss $ \s -> maybe s (review l) (preview l s) == s
