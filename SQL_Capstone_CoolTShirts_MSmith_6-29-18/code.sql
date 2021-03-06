SELECT COUNT(DISTINCT utm_campaign)
FROM page_visits;


SELECT COUNT(DISTINCT utm_source)
FROM page_visits;


SELECT DISTINCT utm_source, utm_campaign
FROM page_visits;


SELECT DISTINCT page_name
FROM page_visits;


WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT COUNT(ft.first_touch_at), utm_campaign
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
 GROUP BY utm_campaign;


WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT COUNT(lt.last_touch_at), utm_campaign
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
 GROUP BY utm_campaign;


SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '4 - purchase';


WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT COUNT(lt.last_touch_at), utm_campaign
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
 WHERE page_name = '4 - purchase'
 GROUP BY utm_campaign;
