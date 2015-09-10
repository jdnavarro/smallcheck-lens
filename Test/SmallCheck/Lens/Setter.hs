{-# LANGUAGE FlexibleContexts #-}
-- | This module is intended to be imported @qualified@, for example:
--
-- > import qualified Test.SmallCheck.Lens.Setter as Setter
--
module Test.SmallCheck.Lens.Setter where
import Control.Lens
import Test.SmallCheck (Property)
import qualified Test.SmallCheck as SC (over)
import Test.SmallCheck.Series (Series, Serial)
import Test.SmallCheck.Series.Utils (zipLogic3)

identity
  :: (Eq s, Monad m, Show s)
  => ASetter' s a -> Series m s -> Property m
identity l se = SC.over se $ \s -> over l id s == s

setSet
  :: (Monad m, Eq s, Show s, Show a)
  => ASetter' s a -> Series m s -> Series m a -> Series m a -> Property m
setSet l ss as bs =
    SC.over ss $ \s ->
        SC.over as $ \a ->
            SC.over bs $ \b ->
    set l b (set l a s) == set l b s

composition
  :: (Monad m, Eq s, Show s, Show a, Serial Identity a)
  => ASetter' s a
  -> Series m s
  -> Series m (a -> a)
  -> Series m (a -> a)
  -> Property m
composition l ss fs gs =
    SC.over ss $ \s ->
        SC.over fs $ \f ->
            SC.over gs $ \g ->
    over l f (over l g s) == over l (f . g) s

compositionSum
  :: (Monad m, Eq s, Show s, Show a, Serial Identity a)
  => ASetter' s a
  -> Series m s
  -> Series m (a -> a)
  -> Series m (a -> a)
  -> Property m
compositionSum l ss fs gs = SC.over (zipLogic3 ss fs gs) $ \(s,f,g) ->
    over l f (over l g s) == over l (f . g) s
