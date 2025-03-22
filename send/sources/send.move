module send::token_transfer {
    use sui::coin::{Self, Coin};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::sui::SUI;
    use std::string::{Self, String};

    /// Event emitted when tokens are transferred
    struct TransferEvent has copy, drop {
        from: address,
        to: address,
        amount: u64,
        description: String
    }

    /// Transfers SUI tokens to a specified recipient address with a description
    /// * `coin` - The SUI coin object to transfer from
    /// * `amount` - The amount of SUI tokens to transfer
    /// * `recipient` - The address of the recipient
    /// * `description` - A description or reason for the transfer
    /// * `ctx` - The transaction context
    public entry fun send_sui_with_description(
        coin: &mut Coin<SUI>, 
        amount: u64, 
        recipient: address,
        description: vector<u8>,
        ctx: &mut TxContext
    ) {
        // Check if we have enough balance
        let balance = coin::value(coin);
        assert!(balance >= amount, 0); // Error code 0 means insufficient balance

        // Convert description bytes to String
        let description_string = string::utf8(description);
        
        // Get sender address
        let sender = tx_context::sender(ctx);
        
        // Emit transfer event
        let transfer_event = TransferEvent {
            from: sender,
            to: recipient,
            amount: amount,
            description: description_string
        };
        
        // Emit the event (using pseudo-code since Sui doesn't have a standard event system)
        // In a real implementation, you might use a different pattern for events
        sui::event::emit(transfer_event);

        // Split the coin and send the specified amount to the recipient
        let split_coin = coin::split(coin, amount, ctx);
        transfer::public_transfer(split_coin, recipient);
    }

    /// Transfers the entire SUI coin to a specified recipient address with a description
    /// * `coin` - The SUI coin object to transfer
    /// * `recipient` - The address of the recipient
    /// * `description` - A description or reason for the transfer
    /// * `ctx` - The transaction context
    public entry fun send_entire_sui_coin_with_description(
        coin: Coin<SUI>, 
        recipient: address,
        description: vector<u8>,
        ctx: &mut TxContext
    ) {
        // Get total amount in the coin
        let amount = coin::value(&coin);
        
        // Convert description bytes to String
        let description_string = string::utf8(description);
        
        // Get sender address
        let sender = tx_context::sender(ctx);
        
        // Emit transfer event
        let transfer_event = TransferEvent {
            from: sender,
            to: recipient,
            amount: amount,
            description: description_string
        };
        
        // Emit the event
        sui::event::emit(transfer_event);

        // Transfer the entire coin to the recipient
        transfer::public_transfer(coin, recipient);
    }
}