while true do
 
-- URL of your external service that returns the JSON response
local url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=NVDA&apikey=EZYF20A4H6JZ785J"
 
local function getNvidiaStockPrice()
    -- Make the HTTP GET request
    local response = http.get(url)
    
    -- Check if the request was successful
    if response then
        -- Read the entire content of the response
        local responseBody = response.readAll()
        response.close()
        
        -- Parse the JSON response body to a Lua table
        local jsonData = textutils.unserializeJSON(responseBody)
        
        -- Extract the stock price
        if jsonData and jsonData["Global Quote"] and jsonData["Global Quote"]["05. price"] then
            local stockPrice = jsonData["Global Quote"]["05. price"]
            print("NVIDIA Stock Price: $" .. stockPrice)
        else
            print("Failed to extract stock price from the response.")
        end
    else
        print("Failed to fetch stock price.")
    end
end
 
getNvidiaStockPrice()
sleep(3600)
term.clear()
end
