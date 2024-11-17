module MyModule::GasFeeOptimizer {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct to track gas fee discounts for users.
    struct UserGasDiscount has store, key {
        discount_percentage: u8, // Discount percentage on gas fees
    }

    /// Function to set a gas discount for a user.
    public fun set_discount(user: &signer, discount_percentage: u8) {
        assert!(discount_percentage <= 100, 1); // Ensure valid percentage
        let discount = UserGasDiscount {
            discount_percentage,
        };
        move_to(user, discount);
    }
}
