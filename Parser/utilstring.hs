module UtilString
( begins_with
, extract_next_from_selection
, join
) where

-- s1 begins with s2
begins_with :: String -> String -> Bool
begins_with "" s2 = "" == s2
begins_with s1 "" = True
begins_with (c1:s1) (c2:s2) =
    if c1 == c2
        then begins_with s1 s2
        else False

extract_next_from_selection :: [t] -> (t -> String -> Maybe String) -> String -> Maybe (t, String)
extract_next_from_selection selection matches string =
    helper selection
    where
        helper ss = case ss of
            []     -> Nothing
            (x:xs) -> case x `matches` string of
                Just s  -> Just (x, s)
                Nothing -> helper xs

join :: String -> [String] -> String
join conjunction ss = case ss of
    []     -> ""
    [x]    -> x
    (x:xs) -> x ++ conjunction ++ join conjunction xs