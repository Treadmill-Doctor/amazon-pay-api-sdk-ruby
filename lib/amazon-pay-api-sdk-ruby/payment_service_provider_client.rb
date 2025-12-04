module PaymentServiceProviderClient
    # API to create dispute. 
    # The createDispute operation is used to notify Amazon of a newly created chargeback dispute by a buyer on a
    # transaction processed only by the PSP (Payment Service Provider), ensuring the dispute is properly accounted for in the Amazon Pay systems.
    # NOTE: This API is intended to be called only by PSPs (Payment Service Providers).
    # @param {Object} payload - The payload containing statusDetails.
    # @param {Object} headers - Requires : x-amz-pay-idempotency-key, Optional headers for the request, such as authorization tokens or custom headers.
    # @return [HTTPResponse] The response from the API call, which includes details of the dispute.
    def create_dispute(payload, headers: {});    
        api_call(Constants::DISPUTE_URLS, Constants::POST, payload: payload, headers: headers)
    end

    # API to get dispute. 
    # The getDispute operation is used to retrieve details of a chargeback dispute associated with a specific order
    # @param {Object} headers - Optional headers for the request, such as x-amz-pay-idempotency-key, authorization tokens or custom headers.
    # @return [HTTPResponse] The response from the API call, which includes details of the dispute.
    def get_dispute(dispute_id, headers: {});    
        api_call("#{Constants::DISPUTE_URLS}/#{dispute_id}", Constants::GET, headers: headers)
    end

    # API to update dispute. 
    # The updateDispute operation is used to notify Amazon of the closure status of a chargeback dispute initiated by a
    # buyer for orders, ensuring proper accounting within the Amazon systems.
    # @param {String} dispute_id - The unique ID of the dispute to retrieve.
    # @param {Object} payload - The payload containing statusDetails.
    # @param {Object} headers - Optional headers for the request, such as x-amz-pay-idempotency-key, authorization tokens or custom headers.
    # @return [HTTPResponse] The response from the API call, which includes details of the dispute.
    def update_dispute(dispute_id, payload, headers: {});    
        api_call("#{Constants::DISPUTE_URLS}/#{dispute_id}", Constants::PATCH, payload: payload, headers: headers)
    end

    # API to contest dispute.
    # The contestDispute operation is used by the partner, on behalf of the merchant, to formally contest a dispute
    # managed by Amazon, requiring the submission of necessary evidence files within the specified
    # Dispute Window (11 days for Chargeback, 7 days for A-Z Claims).
    # @param {String} dispute_id - The unique ID of the dispute to retrieve.
    # @param {Object} payload - The payload containing statusDetails.
    # @param {Object} headers - Optional headers for the request, such as x-amz-pay-idempotency-key, authorization tokens or custom headers.
    # @return [HTTPResponse] The response from the API call, which includes details of the dispute.
    def contest_dispute(dispute_id, payload, headers: {});    
        api_call("#{Constants::DISPUTE_URLS}/#{dispute_id}/contest", Constants::POST, payload: payload, headers: headers)
    end

    # API to upload file.
    # The uploadFile operation is utilised to upload file-based evidence when a
    # merchant contests a dispute, providing the necessary reference ID to the evidence file as part of
    # the Update Dispute API process.
    # @param {Object} headers - Requires : x-amz-pay-idempotency-key, Optional headers for the request, such as authorization tokens or custom headers.
    # @return [HTTPResponse] The response from the API call, which includes details of the file.
    def upload_file(payload, headers: {});    
        api_call(Constants::FILES_URLS, Constants::POST, payload: payload, headers: headers)
    end

    # API to create store.
    # The createStore operation is used to create a new store for a merchant account.
    # This allows merchants to configure store-specific settings like allowed domains, redirect URLs,
    # store name, privacy policy URL, merchant logo URL, and store status.
    # @param {String} merchant_account_id - The unique ID of the merchant account to create the store for.
    # @param {Object} payload - The payload containing store configuration details.
    # @param {Object} headers - Optional headers for the request, such as authorization tokens or custom headers.
    # @return [HTTPResponse] The response from the API call, which includes details of the created store.
    def create_store(merchant_account_id, payload, headers: {})
        api_call("#{Constants::MERCHANT_ACCOUNTS_BASE_URL}/#{merchant_account_id}/#{Constants::STORES_URL}", Constants::POST, payload: payload, headers: headers)
    end

    # API to update store.
    # The updateStore operation is used to update an existing store's configuration.
    # This allows merchants to modify store-specific settings like allowed domains, redirect URLs,
    # store name, privacy policy URL, merchant logo URL, and store status.
    # @param {String} merchant_account_id - The unique ID of the merchant account that owns the store.
    # @param {String} store_id - The unique ID of the store to update.
    # @param {Object} payload - The payload containing updated store configuration details.
    # @param {Object} headers - Optional headers for the request, such as authorization tokens or custom headers.
    # @return [HTTPResponse] The response from the API call, which includes details of the updated store.
    def update_store(merchant_account_id, store_id, payload, headers: {})
        api_call("#{Constants::MERCHANT_ACCOUNTS_BASE_URL}/#{merchant_account_id}/#{Constants::STORES_URL}/#{store_id}", Constants::PATCH, payload: payload, headers: headers)
    end
end
