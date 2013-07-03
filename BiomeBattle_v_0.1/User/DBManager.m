//
//  DBManager.m
//  BBPlayersInfo
//
//  Created by Lingcong Liang on 6/21/13.
//  Copyright (c) 2013 Lingcong Liang. All rights reserved.
//

#import "DBManager.h"
#import "AmazonClientManager.h"
#import "MD5.h"
@implementation DBManager

+(void)createTable
{
    DynamoDBCreateTableRequest *createTableRequest = [[DynamoDBCreateTableRequest new] autorelease];
    
    DynamoDBProvisionedThroughput *provisionedThroughput = [[DynamoDBProvisionedThroughput new] autorelease];
    provisionedThroughput.readCapacityUnits  = [NSNumber numberWithInt:8];
    provisionedThroughput.writeCapacityUnits = [NSNumber numberWithInt:3];
    
    DynamoDBKeySchemaElement *keySchemaElement = [[[DynamoDBKeySchemaElement alloc] initWithAttributeName:TEST_TABLE_HASH_KEY
                                                                                               andKeyType:@"HASH"] autorelease];
    DynamoDBAttributeDefinition *attributeDefinition = [[DynamoDBAttributeDefinition new] autorelease];
    //DEFINE THE PRIMARY AND IT'S TYPE
    attributeDefinition.attributeName = TEST_TABLE_HASH_KEY;
    attributeDefinition.attributeType = @"S";
    
    createTableRequest.tableName = TEST_TABLE_NAME;
    createTableRequest.provisionedThroughput = provisionedThroughput;
    [createTableRequest addKeySchema:keySchemaElement];
    [createTableRequest addAttributeDefinition:attributeDefinition];
    
    DynamoDBCreateTableResponse *response = [[AmazonClientManager ddb] createTable:createTableRequest];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
    }
}

/*
 * Retrieves the table description and returns the table status as a string.
 */
+(NSString *)getTestTableStatus
{
    DynamoDBDescribeTableRequest  *request  = [[[DynamoDBDescribeTableRequest alloc] initWithTableName:TEST_TABLE_NAME] autorelease];
    DynamoDBDescribeTableResponse *response = [[AmazonClientManager ddb] describeTable:request];
    if(response.error != nil)
    {
        if([[response.error.userInfo objectForKey:@"exception"] isKindOfClass:[DynamoDBResourceNotFoundException class]])
        {
            return nil;
        }
        
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
        
        return nil;
    }
    
    return response.table.tableStatus;
}

+(void)insertUsers:(NSString*)UserID insertPassword:(NSString *)Password insertName:(NSString *)Name insertEmail:(NSString *) Email insertDeck:(NSMutableArray *)DeckIDs
{
        //Assign attributes
        NSMutableDictionary *userDic =
        [NSDictionary dictionaryWithObjectsAndKeys:
         [[[DynamoDBAttributeValue alloc] initWithS:UserID] autorelease], TEST_TABLE_HASH_KEY,
         [[[DynamoDBAttributeValue alloc] initWithS: Name] autorelease], @"Name",
         [[[DynamoDBAttributeValue alloc] initWithS: Email] autorelease], @"E-mail",
         //apply a hash function to protect password
         [[[DynamoDBAttributeValue alloc] initWithS: [MD5 uniqueIDFromString:Password]] autorelease], @"Password",
         [[[DynamoDBAttributeValue alloc] initWithSS: DeckIDs] autorelease], @"DeckID",
         nil];
    
    //send request to DynamoDB for putting data
        DynamoDBPutItemRequest *request = [[[DynamoDBPutItemRequest alloc] initWithTableName:TEST_TABLE_NAME andItem:userDic] autorelease];
        DynamoDBPutItemResponse *response = [[AmazonClientManager ddb] putItem:request];
        if(response.error != nil)
        {
            [AmazonClientManager wipeCredentialsOnAuthError:response.error];
            NSLog(@"Error: %@", response.error);

        }
    
}

+(NSMutableArray *)getUserList
{
    //send request to DynamoDB
    DynamoDBScanRequest  *request  = [[[DynamoDBScanRequest alloc] initWithTableName:TEST_TABLE_NAME] autorelease];
    DynamoDBScanResponse *response = [[AmazonClientManager ddb] scan:request];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
        
        return nil;
    }
    
    return response.items;
}

/*
 * Retrieves all of the attribute/value pairs for the specified user.
 */
+ (NSMutableDictionary *)getUserInfo:(NSString *)userID
{
    DynamoDBGetItemRequest *getItemRequest = [[DynamoDBGetItemRequest new] autorelease];
    
    DynamoDBAttributeValue *attributeValue = [[[DynamoDBAttributeValue alloc] initWithS:[NSString stringWithFormat:@"%@", userID]] autorelease];
    
    getItemRequest.tableName = TEST_TABLE_NAME;
    getItemRequest.key = [NSMutableDictionary dictionaryWithObject:attributeValue
                                                            forKey:TEST_TABLE_HASH_KEY];
    
    DynamoDBGetItemResponse *getItemResponse = [[AmazonClientManager ddb] getItem:getItemRequest];
    if(getItemResponse.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:getItemResponse.error];
        NSLog(@"Error: %@", getItemResponse.error);
        
        return nil;
    }
    
    return getItemResponse.item;
}

+(bool) VerifyUser:(NSString *)userID verifyPassword:(NSString *)Password{
    NSDictionary* mydic = [DBManager getUserInfo:userID];
    NSString *tmp =[ [mydic valueForKey:@"Password"] valueForKey:@"s"];
    NSString *compare = [MD5 uniqueIDFromString:Password];
    if ([tmp isEqualToString: compare]) {
        return true;
    }else{
        return false;
    }
}

/*
 * Updates one attribute/value pair for the specified user.
 */
+(void)updateAttributeStringValue:(NSString *)aValue forKey:(NSString *)aKey withPrimaryKey:(DynamoDBAttributeValue *)aPrimaryKey
{
    DynamoDBUpdateItemRequest *updateItemRequest = [[DynamoDBUpdateItemRequest new] autorelease];
    
    DynamoDBAttributeValue *attributeValue = [[[DynamoDBAttributeValue alloc] initWithS:aValue] autorelease];
    DynamoDBAttributeValueUpdate *attributeValueUpdate = [[[DynamoDBAttributeValueUpdate alloc] initWithValue:attributeValue
                                                                                                    andAction:@"PUT"] autorelease];
    
    
    updateItemRequest.tableName = TEST_TABLE_NAME;
    updateItemRequest.attributeUpdates = [NSMutableDictionary dictionaryWithObject:attributeValueUpdate
                                                                            forKey:aKey];
    updateItemRequest.key = [NSMutableDictionary dictionaryWithObject:aPrimaryKey
                                                               forKey:TEST_TABLE_HASH_KEY];
    
    DynamoDBUpdateItemResponse *updateItemResponse = [[AmazonClientManager ddb] updateItem:updateItemRequest];
    if(updateItemResponse.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:updateItemResponse.error];
        NSLog(@"Error: %@", updateItemResponse.error);
    }
}

/*
 * Deletes the specified user and all of its attribute/value pairs.
 */
+(void)deleteUser:(DynamoDBAttributeValue *)aPrimaryKey
{
    DynamoDBDeleteItemRequest *deleteItemRequest = [[DynamoDBDeleteItemRequest new] autorelease];
    
    deleteItemRequest.tableName = TEST_TABLE_NAME;
    deleteItemRequest.key = [NSMutableDictionary dictionaryWithObject:aPrimaryKey
                                                               forKey:TEST_TABLE_HASH_KEY];
    
    DynamoDBDeleteItemResponse *deleteItemResponse = [[AmazonClientManager ddb] deleteItem:deleteItemRequest];
    if(deleteItemResponse.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:deleteItemResponse.error];
        NSLog(@"Error: %@", deleteItemResponse.error);
    }
}

/*
 * Deletes the test table and all of its users and their attribute/value pairs.
 */
+(void)cleanUp
{
    DynamoDBDeleteTableRequest *request = [[[DynamoDBDeleteTableRequest alloc] initWithTableName:TEST_TABLE_NAME] autorelease];
    DynamoDBDeleteTableResponse *response = [[AmazonClientManager ddb] deleteTable:request];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
    }
}
@end
